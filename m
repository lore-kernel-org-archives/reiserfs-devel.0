From: jbingemer@oilgear.de
Subject: Antwort: Re: Antwort: Re: Problems with reiserfsck 3.6.9 (Newbie)
Date: Mon, 21 Jul 2003 13:10:11 +0200
Message-ID: <OF6EB751F0.4C39EA74-ONC1256D6A.003D01A3-C1256D6A.003D6E1E@oilgear.de>
References: <1058785102.30131.3.camel@haron.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 003D6E1DC1256D6A_="
Return-path: <reiserfs-list-return-14976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1058785102.30131.3.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=_alternative 003D6E1DC1256D6A_=
Content-Type: text/plain; charset="US-ASCII"

Yury Umanets <umka@namesys.com> schrieb am 21.07.2003 12:58:23:


> > Jul  6 02:01:47 bi kernel: is_tree_node: node level 17747 does not
> > match to the expected one 1
> > Jul  6 02:01:47 bi kernel: vs-5150: search_by_key: invalid format
> > found in block 42752. Fsck?
> Yes, this definitely means, that you have corrupted some formatted nodes
> on your reiserfs partition.

This does not sound very good.


> > Just to be sure nothing is missing, I uploaded the output of dmesg to
> > http://www.baetmaen.de/dmsg.tar.gz (6kb)
> Sorry, but we need system log. Something like /var/log/messages. 

Oh, I wanted to give you some information on the hardware in case I missed 
something.

OK here is the syslog, I have no idea on how to sort out relevant 
information, sorry about that.

http://www.baetmaen.de/syslog.tar.gz (40K)

Regards
joerg
--=_alternative 003D6E1DC1256D6A_=--
