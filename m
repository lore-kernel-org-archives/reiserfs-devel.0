From: David Masover <ninja@slaphack.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Tue, 06 Sep 2005 15:45:55 -0500
Message-ID: <431E0003.2080003@slaphack.com>
References: <4317FD1B.504@namesys.com>	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>	 <b14e81f005090318046ee67d7e@mail.gmail.com>	 <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com>	 <20050906135951.GA12333@zero> <b14e81f0050906133278ca728e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25883-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050906133278ca728e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: thenewme91@gmail.com
Cc: Tom Vier <tmv@comcast.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

michael chang wrote:

> Okay, this sounds sane, but at the same time, from a implementational
> point of view, how do you tell which blocks are reserved and which
> arent?

I thought it wasn't specific blocks, but rather a certain number of
blocks (any blocks) which must be free in order for any write to
succeed.  Which is why it makes more sense to me as a mount option.
