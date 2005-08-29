From: Hans Reiser <reiser@namesys.com>
Subject: Re: fs_mark benchmark - update
Date: Mon, 29 Aug 2005 13:30:57 -0700
Message-ID: <43137081.6070304@namesys.com>
References: <3257ddd0050825050117ead2ba@mail.gmail.com>	 <430DC64D.9010205@namesys.com> <4313006C.9040502@emc.com>	 <Pine.LNX.4.63.0508291436100.29195@alpha.polcom.net>	 <1125319246.5544.19.camel@localhost.localdomain>  <43130DC1.20105@emc.com>	 <1125322484.5544.23.camel@localhost.localdomain> <431311A1.8030906@emc.com> <1125323863.5544.34.camel@localhost.localdomain> <43131684.5040708@emc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43131684.5040708@emc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ric Wheeler <ric@emc.com>
Cc: mingz@ele.uri.edu, Grzegorz Kulewski <kangur@polcom.net>, "Vladimir V. Saveliev" <vs@namesys.com>, Sandeep Tyagi <sandeepktyagi@gmail.com>, okuyamak@dd.iij4u.or.jp, reiserfs <reiserfs-list@namesys.com>

reiser4 will suck at fsync performance, I guarantee it.  fsync is
completely unoptimized.  It works reliably, but it will be slow. 

The suckage is all eminently fixable,  but not before vanilla inclusion
is resolved will we address it.
