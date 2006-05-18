From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: Reiser4 release date and status
Date: Thu, 18 May 2006 07:52:21 +0200
Message-ID: <446C0B95.7020102@dermichi.com>
References: <5502B4E900B1A04AAA35CB57979B8C9A27820F@spi-mail2003.spitech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28645-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5502B4E900B1A04AAA35CB57979B8C9A27820F@spi-mail2003.spitech.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Sinang, Danny" <D.Sinang@spi-bpo.com>
Cc: reiserfs-list@namesys.com

Hello,
 > I noticed the "REISER4 RELEASED!" statement in
 > http://www.namesys.com/download.html and wonder when it did get released
 > and what its status now.
it is released but from my experience the latest changes that were 
necessary to prepare for inclusion into the vanilla kernel have 
destabilized the code somewhat.

 > The web page seems to have last been updated August 5, 2004 and the
 > warning still says "but until a program has seen a few million real
 > users you should not use it for a mission critical server."
 > Does this warning still hold ?
i'd say this warning still holds for mission-critical servers. it's ok 
for desktop use and for testing and development purposes. i may add that 
the warning is true for about any software that is released, for example 
you need not be the first one to adapt apache 2.2 on a mission-critical 
server either.

kind regards,
michael
