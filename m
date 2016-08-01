From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Containers in Reiser4 (Was: Semantic (mountable) subvolumes in
 Reiser4)
Date: Mon, 1 Aug 2016 13:24:01 +0200
Message-ID: <bd8fe9d2-89fb-d4ea-0e14-13b7e507c608@gmail.com>
References: <579C714A.7040304@gmail.com>
 <CAMDqdwyCMJHyHXhoriWbFhHNrkEOphC5CuyhiS0haa9=Fvyziw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=pdzr0OCVExYuZ1SE/OXMmU9nYEcrFdxUrL9tmdggNxg=;
        b=MwmlbWaCE6NUhUBz4leX9TBTJLob1QzTIW78Fdl3czZZEceu/tDginU9MjIXNMHWJ2
         K4wvcnooX3gBBwLKMhjEr6INfROFkdE6KowC6q95bQDNvtJXxZ0nLzXJ8E5b0N3+zKHp
         sFBOyv3kjl8uIwJEA5cxUvtlO14+AmeLKKzJ4j5gnedOWsXqOCwDeK+Qyx6t73wCtpGr
         9ibTL2ivk8Z5ouu3bc/8JkHBLOU5d3Fiygk0eY4S7JPehXBusPwHueqXaOiuwMpuesLr
         igxkAMBir8a4ZZzCBCzVzQOtnTM7G+raB9CPNuYT/+szREiEXYuRK29RAjWAH8DPWpub
         cA1w==
In-Reply-To: <CAMDqdwyCMJHyHXhoriWbFhHNrkEOphC5CuyhiS0haa9=Fvyziw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Mathieu_B=c3=a9langer?= <b747xx@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Well, first of all I suggest to rename it, as the term "subvolume" is
already reserved for the parts of reiser4 logical volumes, that I am
currently working on. How about "storage containers", or simply
"containers"?

So a container is an isolated semantic subtree associated with some
reiser4 partition and rooted with some directory (let's call it
container's root). Isolation means that container's root doesn't have
a parent, and, hence, can not be accessible by ->lookup() during tree
traversal (the procedure of name resolution). Thus, container's root
looks like the volume's root (which also doesn't have a parent).
So we already know how to create container's root: we just need to
create a directory, which is similar to volume's root.


                    1. Creating a container


Every object in reiser4 has locality, which actually is object-id of
the parent. Since container's root (like volume's root) doesn't have a
parent, we should assign the same dummy locality FORMAT40_ROOT_LOCALITY
(decimal 41) to the container's root.

Directories in reiser4 as well as other objects are created by the
function create_vfs_object(). Specifically, for every new directory
this function creates:
a) stat-data of the new directory;
b) cde-item with two units (entries "." and "..").

The problem is that create_vfs_object() thinks of every new object as
a child of volume's root, whereas container's root is not a child.
So we'll need to work around this - simply don't perform any actions
intended for the parent (updating number of links, size of the parent,
etc).

The next problem is that there is no dedicated system call to create
containers, so we'll need to create a special user-space utility as a
part of reiser4progs for this, and implement a respective ioctl in
reiser4 kernel module. That utility should accept a mount point, that
reiser4 partition (that we want to create a container on) is mounted
at. Upon successful creation, the utility should return object-id of
the new container.


                   2. Mounting a container


Every newly created container (like every object in reiser4) gets a
unique object-id. This object-id should be passed to mount(8) among
other parameters to inform Reiser4 kernel module, that we want to
mount a certain container. It can be done, for example, by a mount
option. There are examples how to implement a reiser4 mount option,
which require a parameter (object-id of container's root in our case).
I think that we need something like SB_FIELD_OPT (see init_super.c).
The new option should set the passed container's id to the reiser4
superblock.

By default (if no container's id was specified) reiser4 mount
procedure will looks for the root, which have the object-id
FORMAT40_ROOT_OBJECTID. If you specified an object-id by mount option,
then it will look for the respective container's root. In other bits
mounting volume and containers are absolutely similar.


                   3. Unmounting a container


No differences with unmounting a volume.


                   4. Deleting a container


rm -rf mountpoint in proper mount session, then unmount the container
and finally remove the container's root (i.e. empty container) by the
user-space utility. The respective ioctl implementation in reiser4
kernel module should locate and remove the following objects:
a) container's stat-data
b) cde-item with two entries: ".", and ".."

Comments:

1) If container is not empty, then the utility should return error
(suggest user to delete container's content in a proper mount session).

2) Deleting an empty container should be performed in a mount session
for some another container. Otherwise, return error.

3) Volume and containers associated with the same reiser4 partition
are distinguishable only by object-id. Volumes are containers which
always have object-id FORMAT40_ROOT_OBJECTID (decimal 42). In all
other bits containers and volumes are identical. So, you can easily
remove an empty volume like a container by specifying that object-id
(decimal 42). The condition (2) will guarantee that reiser4 partition
will have at least one root (to prevent corruption).

4) If the volume (i.e. container with object-id 42) was deleted, then
mount(8) with no container's id specified will fail because of
inability to find the default root. So after deleting the volume you
will always need to specify container's id at mount time.


      5. Print a list of containers of a Reiser4 partition


Find all roots with locality FORMAT40_ROOT_LOCALITY on the specified
partition and print their object-ids. This is also a business of
user-space utility.

I suggest to create one utility with the name "container.reiser4" for
all needs with the following synopsis:

container.reiser4 -c mountpoint: create a container on the mounted
                                  partition.
container.reiser4 -d object-id mountpoint: delete a container with
                                            specified object-id from
                                            the mounted partition.
container.reiser4 -l mountpoint: print a list of all containers of the
                                  mounted partition.


                     6. Fsck and containers


Current fsck will swear on the containers. I'll help to make it happy.
Fsck should perform semantic passes in parallel (for all the containers
of the partition). The pleasant bonus is that many containers on the
same partition will make the partition check faster.


Basically, that's all. After mounting a container you'll be able to
access it in "rw", or "ro" modes, depending on how it was mounted -
everything is the same as for usual volumes.

Ah, reiser4_lookup() will require a minor modification to fall into
proper container (I didn't check the code, but think that without
modifications it will always fall into "default" root with object-id
42).

Thanks,
Edward.


On 07/31/2016 07:29 PM, Mathieu B=C3=A9langer wrote:
> I care.
>
> On Sat, Jul 30, 2016 at 4:20 AM, Edward Shishkin=20
> <edward.shishkin@gmail.com <mailto:edward.shishkin@gmail.com>> wrote:
>
>     Semantic (mountable) subvolume is simply a named subtree of the
>     semanic tree.
>     Such subtree has unusual root, which is not refered by the parent
>     directory.
>     That is, parent directory doesn't contain a record about that
>     root. So normally,
>     you can not access this subtree. In order to access a semantic
>     subvolume, you
>     first have to "mount" it. "Mounting" a semantic subvoume creates a
>     reference to
>     its root (specifically, the mount point refers to that root),
>     which makes it
>     accessible. In other bits semantic subvolumes look like usual
>     subtrees of the
>     semantic tree, which are always "visible".
>
>     Semantic subvolumes is not something new, they are present in some
>     other file
>     systems (though with different names) and have many applications in
>     virtualization (mostly due to their "isolation").
>
>     Semantic subvolumes can be easily implemented in Reiser4. if
>     someone cares,
>     then I'll provide details.
>
>     Thanks,
>     Edward.
>     --
>     To unsubscribe from this list: send the line "unsubscribe
>     reiserfs-devel" in
>     the body of a message to majordomo@vger.kernel.org
>     <mailto:majordomo@vger.kernel.org>
>     More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>

