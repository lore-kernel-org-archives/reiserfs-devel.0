From: Mike Young <myoung@wildernessvoice.com>
Subject: Re: Write-once file system
Date: Fri, 27 Jun 2003 20:28:48 -0700
Message-ID: <BB225980.8591%myoung@wildernessvoice.com>
References: <20030627225410.GK31002@jensbenecke.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14768-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030627225410.GK31002@jensbenecke.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Benecke <written_030626@jensbenecke.de>, Jason Holt <jason@lunkwill.org>
Cc: Fong Vang <FVang@zantaz.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Hi Jens,

Interesting idea.  I like it.  I agree with the various comments about
trust, especially as it pertains to administrators.  However, I think at the
very heart of this whole topic is the need to protect against "dubious"
acts.  The latest and greatest security measures and HIPAA acts have a need
for archived, readily accessible, data that cannot be overwritten-- even if
the CFO has a gun to the head of the administrator.

It sounds like this drives towards that end.  It may be stronger than the
requirement, it sure sounds like the direction things are going.  Thanks for
the input on it.

-Mike


On 6/27/03 3:54 PM, "Jens Benecke" <written_030626@jensbenecke.de> wrote:

> On Fri, Jun 27, 2003 at 05:37:05PM +0000, Jason Holt wrote:
> 
>> *Somebody* has to have root.  Just like *something* on the disk has
>> got to be physically capable of writing a sector that it shouldn't.
> 
> <delurk>
> 
> I am using GrSecurity (www.getrewted.net), which is a kernel patch that
> allows detailed ACLs and kernel security enhancements. Once these
> enhancements are configured (at run-time) and "echo 1 >
> /proc/sys/kernel/grsecuity/lock" is executed, it is _not_ possible (even
> for root) to change them again. One of these features is the ability to
> insmod/rmmod, another is the ability to open sockets, another is the
> ability to access raw devices.
> 
> Suppose we have a module that watches over file open calls to the file
> system driver (like the LD_PRELOAD tricks do) and deny write access
> whenever a file already exists.
> 
> 
> Just an idea ... 
> 

