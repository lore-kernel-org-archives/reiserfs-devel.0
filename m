From: Oleg Drokin <green@namesys.com>
Subject: Re: Mount and file system size issue
Date: Fri, 7 Jun 2002 23:26:50 +0400
Message-ID: <20020607232650.A2630@namesys.com>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <3CFFB2CA.6020300@namesys.com> <001201c20d9e$73e5d070$5701a8c0@bomoon> <20020607112121.C12869@namesys.com> <000801c20e3a$df840b20$5701a8c0@bomoon> <20020607200220.A1657@namesys.com> <001601c20e41$b06afd60$5701a8c0@bomoon>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <001601c20e41$b06afd60$5701a8c0@bomoon>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bo <bo@sosnetwork.net>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Jun 07, 2002 at 09:38:01AM -0700, bo wrote:

> one is RAM shortage for bitmap, another is to use Linux2.4.13 or above for
> ARM platform.
> Could it be both?

It is unclear.

> Could you help me what( or how) I need to investigate?

First try 2.4.18, if the symptoms are the same, try to profile a kernel
(man readprofile).

BTW, what kind of ARM system do you have?

Bye,
    Oleg
