From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Conversion from v3.6 to v4 of Reiserfs...
Date: Wed, 25 Feb 2004 12:17:09 +0300
Message-ID: <16444.26645.677420.622216@laputa.namesys.com>
References: <no.id>
	<200402250154.i1P1s0h3028547@sirius.cs.pdx.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402250154.i1P1s0h3028547@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, "The Amazing Dragon (Elliott Mitchell)" <ehem@cs.pdx.edu>

The Amazing Dragon (Elliott Mitchell) writes:
 > > From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
 > >     Actually, there are no a way. You need to backup and re-write it 
 > > your data.
 > > 
 > >     However, I speak with Hans and probably we will release a 
 > > tool/utility for that purpose.
 > 
 > Something like dump?

Cf. "Universal file system convertor":
http://tzukanov.narod.ru/convertfs/

no warranty, especially given that loop-back support required for
convertfs was added into reiser4 only recently.

 > 
 > 

Nikita.

