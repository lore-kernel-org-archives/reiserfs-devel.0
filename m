From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Tue, 28 Mar 2006 12:56:28 -0800
Message-ID: <4429A2FC.7000607@namesys.com>
References: <44206D3C.7050504@free.fr> <4420FFA2.1090908@namesys.com> <44219CC2.3060405@free.fr> <44219FA8.2050606@namesys.com> <44299A35.50800@free.fr> <44299DE8.8080103@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44299DE8.8080103@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Laurent Riffard <laurent.riffard@free.fr>, reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>, Alexander Zarochentcev <zam@namesys.com>, "E. Gryaznova" <grev@namesys.com>

I think what this means is that after we have a repacker, we should gain
performance advantages over our competition as a result.  It is far
easier for us to code an online repacker than it is for them.

Hans

