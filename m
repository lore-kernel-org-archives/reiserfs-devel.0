From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Feature request: online fsync disable
Date: Fri, 23 Aug 2002 16:09:26 +0400
Message-ID: <15718.9718.736822.978374@laputa.namesys.com>
References: <3D661C89.C8A805D7@baldauf.org>
	<15718.8710.244926.960377@laputa.namesys.com>
	<20020823155658.A962@namesys.com>
	<3D6623BE.4040500@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D6623BE.4040500@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Xuan Baldauf <xuan--reiserfs@baldauf.org>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>, zam@thebsh.namesys.com

Hans Reiser writes:
 > It is a reasonable feature request I think.
 > 
 > Zam, put it into reiser4.1.
 > 

I think, in stead of feature "disable fsync", better alternative would
be "disable journalling", or "journal meta-data only".

Nikita.
