From: PFC <lists@boutiquenumerique.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 01 Sep 2005 15:03:43 +0200
Message-ID: <op.swfc8hleth1vuj@localhost>
References: <20050901134604.31ddd297@SiRiUS.home> <20050901144842.34629bcf@SiRiUS.home> <4316F9CC.2090904@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4316F9CC.2090904@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>, Thomas Kuther <gimpel@sonnenkinder.org>
Cc: reiserfs-list@namesys.com


>>> 250GB disk

Well, 250GB is the "marketing capacity", the real formatted capacity is  
always less (ask fdisk) also of course you have 1024 vs 1000

> reiser4 reserves 5% of disk space for its internal needs.

	So, do you mean this 5% is for metadata, and thus it would be used anyway  
on any other filesystem as files are written, and thus it makes absolutely  
no difference ?


