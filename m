From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: I've done a very bad mistake
Date: Thu, 1 Jul 2004 18:25:05 +0300
Message-ID: <20040701152505.GI4990@nysv.org>
References: <200407011523.48481.aotto1968@onlinehome.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200407011523.48481.aotto1968@onlinehome.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aotto1968@t-online.de
Cc: reiserfs-list@namesys.com

On Thu, Jul 01, 2004 at 03:23:48PM +0200, Andreas Otto wrote:
>  I need a tool with partition as input (dev/hdb7) and all not damaged files
>  as output

I haven't tried dd_rescue but maybe you should read /dev/hdb7 with it
and skip the beginning, as much from the beginning as the accidentally
copied file is.

Then try fsck with some appropriate rebuild switches on the image.

-- 
mjt

