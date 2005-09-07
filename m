From: Tom Vier <tmv@comcast.net>
Subject: Re: journal size reiserfs vs reiser4
Date: Wed, 7 Sep 2005 10:01:46 -0400
Message-ID: <20050907140146.GA17621@zero>
References: <4317FD1B.504@namesys.com> <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu> <b14e81f005090318046ee67d7e@mail.gmail.com> <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com> <20050906135951.GA12333@zero> <e692861c0509061336530f30a@mail.gmail.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25892-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <e692861c0509061336530f30a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: reiserfs-list@namesys.com

On Tue, Sep 06, 2005 at 04:36:33PM -0400, Gregory Maxwell wrote:
> On 9/6/05, Tom Vier <tmv@comcast.net> wrote:
> > My vote: put the reserve % in the superblock (if it isn't already) and
> > give mkfs a sane default.
> 
> Looking at the code it appears it would be easier to make it a mount
> option that defaults to 5%. Would that work okay for you?

I think that's better than a #define, but i'd still prefer something a
little more sticky than a mount option (a field in the superblock). You
might manually mount it and forget to specify it. I could certainly live
with it as a mount option, but i think putting it in the superblock is
the correct place, imho.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
