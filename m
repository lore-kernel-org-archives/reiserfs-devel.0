From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS Bug - Big Problem
Date: Mon, 17 Jun 2002 13:43:57 +0400
Message-ID: <20020617134357.A29338@namesys.com>
References: <000001c215e1$df905c00$b44f5ec2@Schleppi>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10757-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <000001c215e1$df905c00$b44f5ec2@Schleppi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Weitzel <sebastian.weitzel@fh-stralsund.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 17, 2002 at 11:32:17AM +0200, Sebastian Weitzel wrote:

> I was unpacking a big file (700 MB) and in this operation the system
> crashed. 

What is the kernel version you are using?

> To prevent errors I did a reiserfsck, but this stops with:
> get_next_directory_item: 41005 275370 0x1 DIR is not found

What reiserfsck version do you use?

> I did an reiserfsck --rebuildtree but this don't worked also, now every

What error reiserfsck --rebuildtree have produced for you?
Or was it succesful?

Thank you for the report.

Bye,
    Oleg
