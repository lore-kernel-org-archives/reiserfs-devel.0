From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Specify tmgr.atom_max_age per directory ?
Date: Mon, 19 Dec 2005 10:55:28 +0300
Message-ID: <43A66770.8080306@namesys.com>
References: <20051216140522.GA9781@kruemel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27433-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051216140522.GA9781@kruemel>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Bormuth <ibormuth@efil.de>
Cc: reiserfs-list@namesys.com, ingo@bormuth.org

Hello

Ingo Bormuth wrote:
> Is it (or will it once) be possible to specify tmgr.atom_max_age on a per
> directory basis. To do something link:
> 
>   /      : tmgr.atom_max_age=300
>   /data  : tmgr.atom_max_age=30
>   /var   : tmgr.atom_max_age=900
>   /tmp   : tmgr.atom_max_age=INFINITE
> 
Currently you can only specify transaction manager parameters (atom_max_age for
instance) on per filesystem basic.
There are no plans to allow that on per directory basic.



