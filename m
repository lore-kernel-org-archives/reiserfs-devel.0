From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 support on parted ...
Date: Fri, 06 May 2005 05:26:55 -0700
Message-ID: <427B628F.6050000@namesys.com>
References: <427A0834.7080201@futuretg.com>  <427A99C0.2000105@slaphack.com> <1115335902.24839.4.camel@localhost> <427ADAA4.8000407@slaphack.com> <427AFB43.7090406@namesys.com> <427B3978.8030100@futuretg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <427B3978.8030100@futuretg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Cc: David Masover <ninja@slaphack.com>, Andrew Clausen <clausen@gnu.org>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Dr. Giovanni A. Orlando wrote:

> Hans Reiser wrote:
>
>> I think someone is going to pay us to write the online repacker in the
>> very near future, though I can't say their name.
>>
>> Giovanni, if by parted support you mean that you are going to write a
>> resizer (and now that I take a moment to remember what parted does it
>> seems certain you do mean that), I wish you would not.  We are so
>> amazing far in debt right now....
>>  
>>
> Hi,
>
>    It is important to fix some points to clarify.
>
>    At first, "parted" is a binary that interact with the "libparted"
> library to run
>    some features about partitions, like:
>       * mkfs
>       * fsck
>       * cp
>       * mv
>       * resize
>       * and others.
>
>    Actually, parted have zero support for Reiser4.
>
>    Why we need Reiser4 support inside parted?
>
>    We need that parted support Reiser4, because our installer actualy
> a hacked version of RedHat anaconda
>    uses pyparted that need parted to create the partitions on the FS
> on a new installation.
>    (Therefore also RH people and Linux distro that uses anaconda, like
> YellowDog will benefit for this code).
>
>    Therefore, we don't need to resize Reiser4 partitions actually.

Great, thanks.  Happy to see you add the other stuff.

>
>    The necessary code is not necessarely complicated, because
> libraries are well written.
>    However, I need to understant how Reiser4 do jobs like fsck and
> mkfs and this code
>    cannot be a simple or equivalent (system("mkfs.reiser4")).
>
>    It is necessary to use the parted API to do that.
>
>    FTOSX 2004 includes "reiser4" packages, including "libaal", from
> Sep 2004.
>    (Check ftp://ftp.futuretg.com/pub/FTOSX/FTOSX_Desktop_2004/i386/SRPMS)
>
>    I create some directories, one for parted 1.6.15 (my hacked
> version) and another for (1.6.22), latest one.
>
>    People that want to know more about the internal of this code, can
> browse:
>      
> ftp://ftp.futuretg.com/pub/Projects/parted+Reiser4/Actual_without_support/parted-1.6.15/doc/TUTORIAL
>
>
>    I need to update around 111 chapters in six courses, and therefore
> I will dedicate only 1/2 hours per day to move on
>    on this matter.
>
> Thanks,
> Giovanni.
>
>
>

