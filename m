From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: 13 Feb 2003 15:08:49 -0500
Message-ID: <b2gu0h$f7d$1@satsuki.furryterror.org>
References: <93F527C91A6ED411AFE10050040665D0049C06D5@corpusmx1.us.dg.com> <93F527C91A6ED411AFE10050040665D0049C06D5@corpusmx1.us.dg.com> <200302130522.35829.sam@vilain.net>
Return-path: <reiserfs-list-return-12746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <200302130522.35829.sam@vilain.net>,
Sam Vilain  <sam@vilain.net> wrote:
>But with disks, you can.  Mirroring aside, modern hard disks use S.M.A.R.>T. 
>technology which claims to be able to spot failures before they happen.  
>Many BIOSes will let you turn this feature on and off.  Of course I've 
>never actually seen it in action :-).

I have seen SMART work.  At 11:20:30 I had a disk fail, then smartd put this
in my logs:

	Nov  6 11:20:30 chlorine smartd: Device: /dev/hdb, Failed attribute: 3

Oh, wait, you said "before"...no, I've never actually seen that in
action either.

SMART does give you statistics on ECC recovery rates, temperature, number of
remapped sectors, etc. which can give you a hint, if you keep track of them
over time, when your disk is beginning to have more problems than it did have
when it was newer.  Maybe about 50% of failures can be predicted this way
(but you have no idea _when_ the failure will occur--this afternoon or next
summer?) it's little better than the MTBF rating.  The other 50% of
failures are predicted only after the fact.  :-P

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
