From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: Data-logging and md as / fs bug
Date: Tue, 13 May 2003 17:39:44 +0200
Message-ID: <3EC111C0.2010602@netscape.net>
References: <3EB30852.6090402@netscape.net> <200305062134.42520.christian.mayrhuber@gmx.net> <1052250298.14612.235.camel@tiny.suse.com> <200305062156.27595.Dieter.Nuetzel@hamburg.de> <1052400685.14617.489.camel@tiny.suse.com> <20030512072943.GA21604@namesys.com> <3EC0FE02.9030007@netscape.net> <20030513142501.GI12963@namesys.com> <3EC10879.1040902@netscape.net> <20030513145923.GJ12963@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14093-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 05/13/2003 04:59 PM, Oleg Drokin wrote:
> Hello!
> 
> On Tue, May 13, 2003 at 05:00:09PM +0200, Manuel Krause wrote:
> 
[...]
O.k. Quite thoughtful. But "reverting to proper fix" later sounds 
strange to me.

> 
>>I only did a very little testing when the discussions on 
>>iget5_locked_for-2.4.21-pre5-datalogging.diff, kinoded-? + 
>>inode-dirty-for-kinoded began. And it seemed that kinoded + inode-dirty 
>>doesn't make a difference without quota (as Chris already pointed out) 
>>but that I loose 2s on OpenOffice- and 1s on Netscape7-startup time 
>>without your -pre5 patch. Is that possible or should I improve my 
>>looking-at-the-clock or re-verify that?
> 
> 
> Hm. Loose as in startup now takes XX sec more ? Or XX sec less?

Sorry,
with "loss" <-> "time" I meant "loosing" spare time, "decrease of" work 
time to use ... my English, yes, I'm still still learning.

Clearly, what I meant:
        with iget5-pre5-patch,  without,  with your posted patch
App.   NS7  OOo                NS7  OOo
(s)    10   17                 11+  19+     untested
-
(s) = startup times in seconds

Bye,

  Manuel


