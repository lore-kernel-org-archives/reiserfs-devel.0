From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Fri, 20 Aug 2004 17:04:31 -0400
Message-ID: <4126675F.9070202@comcast.net>
References: <20040820072324.CA4DA15D92@mail03.powweb.com> <200408201610.i7KGAwLm014275@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------030201010806080508030401"
Return-path: <reiserfs-list-return-20443-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408201610.i7KGAwLm014275@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Valdis.Kletnieks@vt.edu
Cc: David Dabbs <david@dabbs.net>, reiser@namesys.com, reiserfs-list@namesys.com

--------------030201010806080508030401
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


The honest answer is that it has been over a year since I looked at the 
SELinux
stuff.  It is on my to-do list to review what's there.

However, modulo that disclaimer, I believe what we are doing can readily 
become
part of a larger strategy, indeed as you point out, it must to truely 
promote security.
This doesn't bother me in the slightest.  I will feel that the time was 
worthwhile if
our implementation becomes a standard part of a larger security 
apparatus, e.g.,
because we proved that file system masks could scale to multi-terabyte 
repositories.

I will take a gander at the paper you reference this weekend.


Valdis.Kletnieks@vt.edu wrote:

>On Fri, 20 Aug 2004 07:23:24 -0000, David Dabbs said:
>
>  
>
>>Hans and George, what did you find lacking in currently-available Linux security
>>module frameworks such as LIDS or LSM? They provide system function hooks
>>in which module writers may control object access. LSM-based work is on-going. See 
>>http://sic.iaik.tugraz.at/Best%20Paper%20Award/2004/LSM_quaritsch_winkler.pdf
>>for details of their addition of module stacking (multiple policies) and hooks into
>>the TCP layer. I'm going to read up on these frameworks.
>>    
>>
>
>Amen to that - while reading through Hans' summary, I was having a hard time
>figuring out what this was buying us that SELinux doesn't provide. Thanks for the
>pointer to the Quartisch&Winkler paper, as module stacking seems to be heating up.
>The "usual scenario" for what people seem to want with LSM is a MAC system
>like SELinux or LIDS, then zero or more "pathological case" handlers (for
>instance, the 'BSD Securelevels' LSM, or some variant of the OpenWall mods, or
>a chroot/jail module) to harden a specific aspect of the system, and then the
>Capabilities LSM.
>
>The biggest reason for wanting to do security at the LSM level rather than the
>filesystem level is because that way you can *really* secure things (hint -
>your filesystem can be as secure as you want, but if you don't also secure
>stuff like unix-domain sockets or SYSV shared memory segments, 2 cooperating
>processes can end-run an MLS trying to prevent it....)
>
>If there's a specific need that you can't think of how to implement via SELinux
>or the low-level LSM calls, please feel free to ask - if the exact nature of
>the problem is itself sensitive, I can vector you to people over on the spook
>side of the fence who should be able to either help you out or redirect you to
>even spookier people.. ;)
>
>  
>

--------------030201010806080508030401
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<br>
The honest answer is that it has been over a year since I looked at the
SELinux<br>
stuff.&nbsp; It is on my to-do list to review what's there.<br>
<br>
However, modulo that disclaimer, I believe what we are doing can
readily become<br>
part of a larger strategy, indeed as you point out, it must to truely
promote security.<br>
This doesn't bother me in the slightest.&nbsp; I will feel that the time was
worthwhile if<br>
our implementation becomes a standard part of a larger security
apparatus, e.g.,<br>
because we proved that file system masks could scale to multi-terabyte
repositories.<br>
<br>
I will take a gander at the paper you reference this weekend.<br>
<br>
<br>
<a class="moz-txt-link-abbreviated" href="mailto:Valdis.Kletnieks@vt.edu">Valdis.Kletnieks@vt.edu</a> wrote:<br>
<blockquote type="cite"
 cite="mid200408201610.i7KGAwLm014275@turing-police.cc.vt.edu">
  <pre wrap="">On Fri, 20 Aug 2004 07:23:24 -0000, David Dabbs said:

  </pre>
  <blockquote type="cite">
    <pre wrap="">Hans and George, what did you find lacking in currently-available Linux security
module frameworks such as LIDS or LSM? They provide system function hooks
in which module writers may control object access. LSM-based work is on-going. See 
<a class="moz-txt-link-freetext" href="http://sic.iaik.tugraz.at/Best%20Paper%20Award/2004/LSM_quaritsch_winkler.pdf">http://sic.iaik.tugraz.at/Best%20Paper%20Award/2004/LSM_quaritsch_winkler.pdf</a>
for details of their addition of module stacking (multiple policies) and hooks into
the TCP layer. I'm going to read up on these frameworks.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Amen to that - while reading through Hans' summary, I was having a hard time
figuring out what this was buying us that SELinux doesn't provide. Thanks for the
pointer to the Quartisch&amp;Winkler paper, as module stacking seems to be heating up.
The "usual scenario" for what people seem to want with LSM is a MAC system
like SELinux or LIDS, then zero or more "pathological case" handlers (for
instance, the 'BSD Securelevels' LSM, or some variant of the OpenWall mods, or
a chroot/jail module) to harden a specific aspect of the system, and then the
Capabilities LSM.

The biggest reason for wanting to do security at the LSM level rather than the
filesystem level is because that way you can *really* secure things (hint -
your filesystem can be as secure as you want, but if you don't also secure
stuff like unix-domain sockets or SYSV shared memory segments, 2 cooperating
processes can end-run an MLS trying to prevent it....)

If there's a specific need that you can't think of how to implement via SELinux
or the low-level LSM calls, please feel free to ask - if the exact nature of
the problem is itself sensitive, I can vector you to people over on the spook
side of the fence who should be able to either help you out or redirect you to
even spookier people.. ;)

  </pre>
</blockquote>
</body>
</html>

--------------030201010806080508030401--

