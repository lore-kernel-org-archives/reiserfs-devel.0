From: Thorsten Mauch <mauch@imkenberg.de>
Subject: AW: rebuildfs
Date: Tue, 5 Aug 2003 18:25:44 +0200
Message-ID: <E5A63F34D141D111A6F4080009D70ACA346D67@imkedv_pdc>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15156-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

first i need to copy the failed raid member.
but i assume this will work also with:

dd_rescue /dec/sda /dev/sdb

and then when i have again a working (of course critical) raid
i copy it to the IDE drive.


-----Ursprungliche Nachricht-----
Von: Vitaly Fertman [mailto:vitaly@namesys.com]
Gesendet: Dienstag, 5. August 2003 18:27
An: Thorsten Mauch; 'reiserfs-list@namesys.com'
Betreff: Re: AW: rebuildfs


On Tuesday 05 August 2003 19:55, Thorsten Mauch wrote:
> my failed HDD is a raid member. Is it possible to use
> dd_rescure also to copy the raw hhd ?

yes, you can dd_rescue your /dev/rd/c0d0 to /dev/hda.

-- 
Thanks,
Vitaly Fertman
