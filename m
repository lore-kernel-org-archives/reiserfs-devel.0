From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 non-free?
Date: Tue, 11 May 2004 10:57:01 -0700
Message-ID: <40A113ED.8000706@namesys.com>
References: <1084188152.26226.196158678@webmail.messagingengine.com> <20040510.214915.74754947.wlandry@ucsd.edu> <200405110158.i4B1wONb022531@turing-police.cc.vt.edu> <20040510.223329.108738295.wlandry@ucsd.edu> <200405111502.i4BF2qOu012463@turing-police.cc.vt.edu>            <40A0F93F.8020604@namesys.com> <200405111635.i4BGZFZ1024441@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405111635.i4BGZFZ1024441@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Walter Landry <wlandry@ucsd.edu>, debian-legal@lists.debian.org, reiserfs-list@namesys.com, ed@debian.org, cavok@debian.org

Valdis.Kletnieks@vt.edu wrote:

>On Tue, 11 May 2004 09:03:11 PDT, Hans Reiser said:
>  
>
>>Valdis.Kletnieks@vt.edu wrote:
>>    
>>
>
>  
>
>>>I pondered the whole "credits" question for a bit last night, and I realized
>>>that (a) I could account for at least the last 75 'mkfs' commands I had caused
>>>to run, and (b) of those 75, exactly *one* did *not* have all of its output
>>>swallowed by 'anaconda' during a RedHat or Fedora install.....
>>>      
>>>
>
>  
>
>>Yes, I believe that, and that is my concern. 
>>    
>>
>
>Unfortunately, this way lies madness - the IBM AIX install stuff *does* scroll
>the copyrights for every single program as it installs.
>
>It *sucks*.  Badly.
>  
>
Random credits are the elegant answer.  Displaying only the distro name 
at boot time is morally wrong.

>I've had system upgrades that have had 12 *thousand* lines of output from
>copyright notices - and the way IBM makes sure that you see them is by
>outputting them to the same place as the error messages, so you can't just
>redirect the notices.
>
>And yes, at least twice I've managed to render a system unbootable because I
>missed something important scrolling by....
>
>The problem isn't "What do we do if Hans does this?".. The problem is that
>Fedora Core 2 is coming in at just under 1,700 RPMs, of which some 750 are
>installed in a default "workstation" install.
>
>What happens when the *other* 749 do it too?  You end up with a tragedy
>of the commons - *none* of the 750 get read, and the installer becomes
>unusable....
>
>  
>
If you display a short blurb explaining what each program does and who 
wrote it, most users will find it interesting as they sit there boredly 
waiting.  If the speed of install is too fast, make them randomly 
selected samples.
