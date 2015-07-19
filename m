From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [FEATURE][PATCH 0/2] reiser4: Auto-punching holes on commit
Date: Mon, 20 Jul 2015 01:47:05 +0800
Message-ID: <55ABE299.5090505@gmail.com>
References: <55ABC569.3040009@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=Zdlgw4nvboKMcf6AXjzH6CSsaxLdfBmcKIC8lkRlV2g=;
        b=LtS8sJNZbgCjDnZKhVptmMyf01mSPm/BrqTdVB0RaXUUc4SpBxPs3auuJZSpmcQTT5
         X0Xew5osYWf/L5QdXDNoawYtaOA5RgcKIrCguJW7KEctU/0cArkW3f5L3yzcC9H81xfd
         LRVpyKFi6HRTMNZEnnO7PiHREdD7qoml1l9zofRB9sTwWsw0uqq9h5oGWH1w+h1wP6z9
         ku3a5S/r4TTcnDQcC63lp53tfXuURd8hil38bridJyvUlAWKFMVz061WDXhtnuhdr1/t
         5/AjZgyJO2UKPMqTdrpNfv/lyYcqMt+SX6hpcYv6GDV1/W4nNvTo28VH/9Q0qHjCzTmw
         mK4w==
In-Reply-To: <55ABC569.3040009@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>



On 07/19/2015 11:42 PM, Edward Shishkin wrote:
>
>                    Auto-punching holes on commit
>
>
> Storing zeros on disk is a rather stupid business. Indeed, right before
> writing data to disk we can convert zeros to holes (this is abstract
> objects described in POSIX), and, hence, save a lot of disk space.
>
> Compressing zeros before storing them on disk is even more stupid
> business: checking for zeros is less expensive procedure than
> compression transform, so in addition we can save a lot of CPU
> resources.
>
> I'll remind how reiser4 implements holes.
> The unix file plugin represents them via extent pointers marked by
> some special way. The situation with cryptcompress file plugin is more
> simple: it represents holes as literal holes (that is, absence of any
> items of specific keys). It means that we can simply check and remove
> all items, which represent a logical chunk filled with zeros. This is
> exactly what we do now at flush time right before commit.
>
> The best time for such check is atom's flush, which is to complete all
> delayed actions. Specifically, it calls a static machine ->convert_node()
> for all dirty formatted nodes. This machine scans all items of a node
> and calls ->convert() method of every such item.
>
> We used this framework for transparent compression on commit
> (specifically to replace old fragments that compose compressed file's
> body with the new ones). Now we use it also to punch holes at logical
> chunks filled with zeros. That is, instead of replacing old items, we
> just remove them from tree. Think of hole punching like of one more
> delayed action.
>
> I have implemented hole punching only for cryptcompress plugin. It also
> can be implemented for "classic" unix-file plugin, which doesn't compress
> data. However, it will be more complicated because of more complicated
> format of holes. Finally, I think that having such feature only for one
> file plugin is enough.
>
>
>                           Solved Problems:
>
>
> When flushing modified dirty pages, the process should be able to find
> in the tree a respective item group to be replaced with new data. So we
> should handle possible races when one process checks/creates the items
> and the flushing process deletes those items during hole punching
> procedure. To avoid this situation we maintain a special "economical"
> counter of checked-in modifications for every logical cluster in struct
> jnode. If the counter is greater than 1, then we simply don't punch a
> hole.
>
>
>                    Mount option "dont_punch_holes"
>
>
> Since hole punching is useful feature for both HDD and SSD, I enabled it
> by default. To turn it off use the mount option "dont_punch_holes". The
> changes are backward and forward compatible, so no new format is needed.
>
>
>                      How it looks on practice:
>
>
> # mkfs.reiser4 -f -y /dev/sdaX
> # mount /dev/sdaX /mnt
> # dd if=/dev/zero of=/mnt/foo bs=65536 count=1000
> # umount /mnt
>
> Now dump the tree:
>
> # debugfs.reiser4 -t /dev/sdaX | less
>
> As we can see (attachment 1) the file foo doesn't have body, only 
> stat-data
> (on-disk inode): we removed its body at flush time, because it is 
> composed
> of zeros (see my remark above about holes). Let's now append non-zero
> data to our file "foo":
>
> # mount /dev/sdaX /mnt
> # echo "This is not zeros" >> /mnt/foo
> # umount /mnt
> # debugfs.reiser4 -t /dev/sdaX | less
>
> As we can see (attachment 2) the body of the file "foo" now consists 
> of only
> one item of length 59, which has offset 0x3e80000 (=65536000). This is 
> exactly
> the string "This is not zeros" supplemented with zeros up to page size 
> (4096)
> and compressed by LZO1 algorithm.


Sorry, I have attached a wrong file in the attachment 2. Should be the 
following:

#3  CTAIL (ctail40): [2a:4(FB):666f6f00000000:10001:3e80000] OFF=340, 
LEN=19, flags=0x0 shift=16

That is, body of file "foo" consists of only one item of length 19 (= 
length of the
string "This is not zeros" plus one byte, where the size of logical 
cluster is stored).
Zeros at the end of in-memory file are not stored on disk !

Thanks,
Edward.
