From: kenny gorman <kgorman@panix.com>
Subject: Re: Reiserfs versions
Date: Tue, 19 Nov 2002 07:05:04 -0800
Message-ID: <3DDA5320.9070605@panix.com>
References: <3DD97831.4030607@panix.com> <20021119093526.A32026@namesys.com> <3DD9EC4B.70907@panix.com> <20021119105123.A3473@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12022-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

I am sorta confused.  I downloaded and compiled the latest 
reiserfsprogs, I also updated my rpm.  How do I know what version I am 
runnning then?

rpm -q shows reiserfs-3.x.0k_pre10-8, but in /usr/local/sbin I have the 
latest 3.6.4 stuff.  How can I be sure my system is updated correctly? 
Should I remove the rpm?

thx
-kg


Oleg Drokin wrote:
> Hello!
> 
> On Mon, Nov 18, 2002 at 11:46:19PM -0800, kenny gorman wrote:
> 
> 
>>I poked around suse's site, and found the 'certified kernel' with:
>>2.4.16-64gb smp
> 
> 
> This one is ok.
> 
> 
>>reiserfs-3.x.0k_pre10-8
> 
> 
> This one is not.
> 
> 
>>See any reason why this combination is not a good idea?
> 
> 
> reiserfs-3.x.0k_pre10 sounds like something very old.
> 
> 
>>How do the version numbers work? I am confused about the 3.x notation 
>>and the 3.6 notation you used below...I upgraded my reiserfsprogs to 
>>3.6.4 just in case, but the filesystem rpm is still 3.x.0k_pre10-8 right?
> 
> 
> The 3.x notation is the obsoletted one which was supposed to mean 3.5 and 3.6,
> recently we changed that confusing scheme to just 3.6.
> 
> 
> You can get reiserfsprogs 3.6.4 from our ftp site, build build rpm from it,
> and then replace your reiserfs package with fersly built one,
> so that your RPM database is in consistent state with what you actually have.
> 
> Or may be SuSE people have newer reiserfsprogs already in updates.
> 
> Bye,
>     Oleg
> 
> .
> 



