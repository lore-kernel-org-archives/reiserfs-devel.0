From: Frank Joerdens <frank@joerdens.de>
Subject: Re: Quota on Debian with 2.4.18
Date: Tue, 17 Sep 2002 15:50:39 +0200
Message-ID: <20020917155039.B28740@superfly.archi-me-des.de>
References: <Pine.LNX.4.44.0209171410001.5546-100000@ariel.planitis.net> <3D8731CB.8060304@osiris.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D8731CB.8060304@osiris.at>; from christian.mayrhuber+mailinglisten.reiserfs@osiris.at on Tue, Sep 17, 2002 at 03:44:43PM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, Sep 17, 2002 at 03:44:43PM +0200, Christian Mayrhuber wrote:
[ . . . ]
> As far as I remember Chris Mason (the reiserfs quota developer),
> building 2.4.18 with quota does not
> work when reiserfs is built as module.

It definitely does work with a static kernel here with 2.4.18 on our
production box. I haven't tried a modular kernel.

Regards, Frank
