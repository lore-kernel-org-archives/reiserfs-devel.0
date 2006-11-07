From: "Danny Milosavljevic" <danny_milo@yahoo.com>
Subject: Re: reiser4 cryptcompress test setup: bug
Date: Tue, 7 Nov 2006 15:13:30 +0000 (UTC)
Message-ID: <eiq7qq$de5$1@sea.gmane.org>
References: <eio2bt$hdj$1@sea.gmane.org>
	<200611062207.kA6M7Gsj002629@turing-police.cc.vt.edu>
Reply-To: danny.milo@scratchpost.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30111-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

On Mon, 06 Nov 2006 17:07:16 -0500, Valdis.Kletnieks wrote:

> On Mon, 06 Nov 2006 19:27:57 GMT, Danny Milosavljevic said:
>> Hi Edward,
>> 
>> I finally tried your cryptcompress setup (2.6.18-mm3) and just did the
>> first evil thing I could think of:
>> 
>> the reiser4 partition with ccreg40 enabled is /dev/sda1 (/mnt/tmp/)
>> (mkfs'ed, thus empty).
> 
>> [  372.564358]  [<c01b6400>] ext3_dirty_inode+0x30/0x90
>> [  372.564364]  [<c016b4b9>] cp_new_stat64+0xf9/0x110
> 
> You might want to check /home sometime - this looks like an ext3 botch
> rather than a reiserfs botch, unless reiser4 is stomping on something
> behind ext3's back.

Well, I thought so at first, but:
/home is reiser4
/ is ext3 
no other ext3s

~/doc/literatur is on /home (checked via 'df .').

So, well, although it looks like it ext3 is the culprit, it is improbable
that it actually was the one triggering first (I never saw that
backtrace before, too). Naturally once Edwards says he doesn't need the
partition for analyzing, I'll nuke it and try to reproduce it again :)

cheers,
  Danny

