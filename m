From: "daniel.poelzleithner" <poelzi@poelzi.org>
Subject: Re: fsck.reiserfs an image file ?
Date: Sat, 20 Nov 2004 23:00:39 +0100
Message-ID: <419FBE87.5070804@poelzi.org>
References: <pan.2004.11.17.20.21.21.102770@unternehmen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22449-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <pan.2004.11.17.20.21.21.102770@unternehmen.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Helge Hielscher <hhielscher@unternehmen.com>
Cc: reiserfs-list@namesys.com

Helge Hielscher wrote:

> after saving a partition with dd_rhelp to an image file I wonder if is
> possible to repair the image to a state where it can be mounted?

You have to create a loopback device for it with "losetup 
/dev/loop[number] /myfile"

and

reiserfsck /dev/loop[number]

kindly regards
  Daniel
