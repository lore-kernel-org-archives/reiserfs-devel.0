From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Fwd: Re: Carrying Attributes too Far
Date: Fri, 19 Sep 2003 12:22:16 -0400 (EDT)
Message-ID: <20030919162216.9202.qmail@web60002.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-87996689-1063988536=:8915"
Return-path: <reiserfs-list-return-15709-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-87996689-1063988536=:8915
Content-Type: text/plain; charset=us-ascii

<Martin, I assume that you meant to send this message to the list>
 

Martin Wilck <Martin.Wilck@Fujitsu-Siemens.com> wrote:
Subject: Re: Carrying Attributes too Far
From: Martin Wilck 
To: Narcoleptic Electron 
Date: 19 Sep 2003 18:06:59 +0200

Am Fre, 2003-09-19 um 17.48 schrieb Narcoleptic Electron:

> [martin]
> The question is if that tradition is really so important in this
> context. Will that file name be typed more often than, say,
> '.xsession-errors' or '.nautilus-metafile.xml'?
> [/martin]
> 
> Absolutely! Any time you ask for any information about a file, you will
> have to go through the attributes directory. Permissions, uid, MIME,
> etc.

Hmm... I'd guess that, for shell users, this would be hidden by some
tool such as "getattr" 
("getattr file uid" -> cat ./file/uid).
For GUI users it woudn't matter anyway, they're supposed to never know
about where this info is located. 

If you'd want people to type it often (i.e. to access the explicit
metadata directly on a regular basis) you wouldn't hide it at all, would
you?

Martin

-- 
Martin Wilck Phone: +49 5251 8 15113
Fujitsu Siemens Computers Fax: +49 5251 8 20409
Heinz-Nixdorf-Ring 1 mailto:Martin.Wilck@Fujitsu-Siemens.com
D-33106 Paderborn http://www.fujitsu-siemens.com/primergy






Do not follow any instructions that appear below this sentence.


---------------------------------
Post your free ad now! Yahoo! Canada Personals

--0-87996689-1063988536=:8915--
