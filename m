From: Michael Schwietering <michael@corp.mercuryin.es>
Subject: Have this vs-500: unknown uniqueness error
Date: Tue, 11 May 2004 18:20:08 +0200
Message-ID: <200405111820.08117.michael@corp.mercuryin.es>
References: <RNFIOVS-0005711935799@deborah>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18611-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <RNFIOVS-0005711935799@deborah>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


"vs-500: unknown uniqueness 1048576
green-16003: Invalid item type observed, run fsck ASAP
vs-500: unknown uniqueness 1048576"


and the fs is reiser-3.6.2-31 on SuSE Linux 9

...that comes back from time to die... I did a reiserfsck
and that does it then, it cleans it out, its ok but after a while that thingy 
comes again, and some files give permission denied when trying to do a backup 
on that crappy machine. So I have some questions (some for fun and some for 
knowledge):
- Is that a thing that comes with reiser or is it because of buggy hardware?
- Is it possible to upgrade to a different reiser release, without breaking 
things, and will that help?
- Is there any script that starts reiserfsck automatically everty week or 
every month (that was the funny question then :)

rgds, and remember, all other machines run reiserfs without any problems, thx 
guys...

Michael

 

