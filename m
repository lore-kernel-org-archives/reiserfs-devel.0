From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: kernel panic with PAP-8252
Date: Tue, 30 Jul 2002 09:13:59 -0400
Message-ID: <200207300913.59888.kuba@mareimbrium.org>
References: <20020730151018.2D2C.K-MORIKAWA@stage.gr.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11102-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020730151018.2D2C.K-MORIKAWA@stage.gr.jp>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "K.Morikawa" <k-morikawa@stage.gr.jp>
Cc: reiserfs-list@namesys.com

> I tried reiserfsck with --check option. however completed with no error.
> so I did not run reiserfsck with --rebuild-tree option.
> machine is operating after reboot.

Another note: please make sure that you use latest reiserfs-tools (version 
3.6.2). You really should not be using anything older than this version, 
especially the 3.x. versions.

Make sure you verify that, since it seems your system hasn't been updated in a 
long time, so I'm nearly sure that you *are* using outdated reiserfstools.

Cheers, Kuba Ober
