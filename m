From: Oleg Drokin <green@namesys.com>
Subject: Re: Which filesystem do errors come from?
Date: Fri, 26 Jul 2002 13:24:10 +0400
Message-ID: <20020726132410.B18706@namesys.com>
References: <Pine.LNX.4.44.0207252352120.1119-100000@grignard.amagerkollegiet.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11081-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0207252352120.1119-100000@grignard.amagerkollegiet.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasmus B?g Hansen <moffe@amagerkollegiet.dk>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello!

On Thu, Jul 25, 2002 at 11:57:34PM +0200, Rasmus B?g Hansen wrote:

> I am getting som errors on a box running reiserfs:
> is_leaf: item location seems wrong (second one): *3.5*[87265 197987 0x1 IND], item_len 1, item_location 1379, free_space(entry_count) 21729
> vs-5150: search_by_key: invalid format found in block 473792. Fsck?
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [87265 216135 0x0 SD]
> [...]

> However, I cannot seem to find out, what filesystem, these errors come
> from:
> How can I see, whether the messages come from hda6 or hdc1?

Unfortunatelly this is impiossible, except you know which files should be
accessed to get this error.
We have some patches thatare supposed to print device name for each
warning/error, but we cannot push anything into 2.4 until 2.4.19 is out anyway.

Bye,
    Oleg
