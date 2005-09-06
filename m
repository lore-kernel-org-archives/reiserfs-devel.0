From: David Masover <ninja@slaphack.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Tue, 06 Sep 2005 16:03:57 -0500
Message-ID: <431E043D.7030206@slaphack.com>
References: <4317FD1B.504@namesys.com>	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>	 <b14e81f005090318046ee67d7e@mail.gmail.com>	 <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com>	 <20050906135951.GA12333@zero>	 <b14e81f0050906133278ca728e@mail.gmail.com>	 <431E0003.2080003@slaphack.com> <b14e81f00509061347171dcc9e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00509061347171dcc9e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: thenewme91@gmail.com
Cc: Tom Vier <tmv@comcast.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

michael chang wrote:
> On 9/6/05, David Masover <ninja@slaphack.com> wrote:
> 
>>michael chang wrote:
>>
>>
>>>Okay, this sounds sane, but at the same time, from a implementational
>>>point of view, how do you tell which blocks are reserved and which
>>>arent?
>>
>>I thought it wasn't specific blocks, but rather a certain number of
>>blocks (any blocks) which must be free in order for any write to
>>succeed.  Which is why it makes more sense to me as a mount option.
>>
> 
> 
> Oh okay then.  That sounds better - it's not like NTFS's MFT area
> designation (very annoying).  Of course, we'd all like it better if
> this space is contiguous, but anywhere is fine, so long as the
> benefits are retained, I guess.  (Besides, if the space *isn't*
> contiguous, logically, it _should_ be possible to make it
> semi-contigous with the repacker, provided enough space (hopefully
> this requirement will be very low) exists to repack in the first
> place.)

Which is already somewhat guarenteed by the reserved free space.
