From: Chris Mason <mason@suse.com>
Subject: Re: Bug in data journaling patch ?!
Date: Tue, 17 Aug 2004 09:01:34 -0400
Message-ID: <1092747694.12138.1510.camel@watt.suse.com>
References: <d68fdf7d04081608477fc84e06@mail.gmail.com>
	 <1092672478.12138.245.camel@watt.suse.com>
	 <d68fdf7d040816092378a16ee9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20353-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <d68fdf7d040816092378a16ee9@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vijayan Prabhakaran <pvijayan@gmail.com>
Cc: reiser@namesys.com, vijayan@cs.wisc.edu, reiserfs-list@namesys.com

On Mon, 2004-08-16 at 12:23, Vijayan Prabhakaran wrote:
> Yes, this happens only on the first transaction after the mount. For
> all other later transactions it works fine.

Perfect, thanks for the verification, I'll cook up patches for both
2.6.x and 2.4.x.

-chris


