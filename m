From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Tue, 15 Aug 2006 23:29:00 -0400
Message-ID: <e692861c0608152029u4ce490e9vb7589c1500e3316d@mail.gmail.com>
References: <44E24899.8080201@namesys.com>
	 <BAY19-F100664FF73F5E9174FEC39944C0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAY19-F100664FF73F5E9174FEC39944C0@phx.gbl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Reinhart <rhino_tom@hotmail.com>
Cc: reiser@namesys.com, edward@namesys.com, reiserfs-list@namesys.com

On 8/15/06, Tom Reinhart <rhino_tom@hotmail.com> wrote:
> Of course, not everyone uses RAID.  ECC would benefit some people in some
> cases... no argument there.

We can use RAID mechanisms (RS erasure code) on a single disk. You
could technically call it ECC, but if you do so you will confuse
people.  "Block level parity" would be correct.
