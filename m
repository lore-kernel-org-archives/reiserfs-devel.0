From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Tue, 6 Sep 2005 16:36:33 -0400
Message-ID: <e692861c0509061336530f30a@mail.gmail.com>
References: <4317FD1B.504@namesys.com>
	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>
	 <b14e81f005090318046ee67d7e@mail.gmail.com>
	 <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com>
	 <20050906135951.GA12333@zero>
Reply-To: gmaxwell@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25880-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050906135951.GA12333@zero>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

On 9/6/05, Tom Vier <tmv@comcast.net> wrote:
> My vote: put the reserve % in the superblock (if it isn't already) and
> give mkfs a sane default.

Looking at the code it appears it would be easier to make it a mount
option that defaults to 5%. Would that work okay for you?
