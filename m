From: Yury Umanets <umka@namesys.com>
Subject: Re: libaal documentation: fact or fiction?
Date: Wed, 08 Oct 2003 22:12:27 +0400
Message-ID: <3F84538B.9010109@namesys.com>
References: <3F82F657.8040605@mbl.ca> <3F83B424.90107@namesys.com> <20031008163202.GA2185@mbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15812-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031008163202.GA2185@mbl.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geoff Oakham <g@mbl.ca>
Cc: reiserfs-list@namesys.com

Geoff Oakham wrote:

>Hi Yury,
>
>Thanks for getting back to me!
>
>On Wed, Oct 08, 2003 at 10:52:20AM +0400, Yury Umanets wrote:
>  
>
>>Libaal has been developed as a try of standard interface between 
>>corresponding FS userspace library (currently libreiser4) and 
>>application that wants to use that library (currently reiser4progs).
>>    
>>
>
>Is this library the userland interface applications use to write to
>files in atomic operations?
>
No. It serves just for having persistent interface for working with 
device inside libreiser4.
Suppose we have to create some structures in /dev/hdb1 durring mkfs. And 
this is job for libreiser4. It calls fs_create() and it then calls 
object_create(fs, "/"), etc. And all these functions need to write and 
to read something from /dev/hdb1. But we can't use just file descriptor 
for writing and reading in libreiser4,  because it then will be bound to 
userspace and posix. What is one will want to use it for repair 
something in dos? Or GRUB will want to use libreiser4 (actually is does) 
to read kernel image from reiser4 durring boot? They will unable to do 
so. There also lots of another cases when raw file descriptor is not enough.

In order to solve all these issues, we have developed device abstraction 
mechanism. Which works like linux kernel drivers (roughly speaking).
That is we have instance of opened device with current device operations 
installed in it. And device have methods read() and write() etc. And 
when we call write(), device calls current wrote operation installed in 
it in the manner like the fiollowing:

int aal_device_write(aal_device_t *dev, char *buff, int off, int n) {
    if (!dev->ops->write)
       return -EINVAL;

    return dev->ops->write(dev->entity, buff, off, n);
}

Device initializing for working with file in usual enviromnent:

dev = aal_device_init("/dev/hdb1", &file_ops);


Device initializing in unusual enviromnent:
dev = aal_device_init("/dev/hdb1", &bios_irqs_using_ops);


and so on.

It is some kind of plugins, but they as not impelemented inside libaal 
(except of file_ops) and we expect, that user who need corresponding 
device abstraction (for instance for working on compressed filesystem 
image) will implement it himself.

>
>  
>
>>BTW, why do you interested in documenting it?
>>    
>>

>A number of reasons: I'm interested in ReiserFs4 and I want to start
>playing with it.  As I understand it, Reiserfs4 will offer data
>journalling and plugin support.. both things I'd like to play with.
>Since neither seems to have been documented yet, I thought I'd start by
>attempting that.
>
Ok, I see, but libreiser4 does not any things with journaling and so on. 
So, probably it is better to start from reading resier4 design documents 
on our website and then take a look to kernel code.


>
>I'm also intersted because data-journalling has the potential to become
>a standard interface for Linux filesystems.. and as an outsider I was
>hoping I would be able to offer suggestions on how to clean up that API
>and speed up its acceptance.
>
We will have userspace API for controlling transactions and other things 
latter when sys_reiser4() is finished.


>  Futhermore, I want to see if it's possible
>to implement the equivalent functionality (at least from a programmer's
>perspective) on a traditional UNIX filesystem using old-fasioned
>file-locking.
>
Can you say more detailed about this? What do you mean speaking about 
old-fasioned file-locking?

>
>Cheers,
>
>Geoff
>
>  
>
Thanks.

-- 
umka


