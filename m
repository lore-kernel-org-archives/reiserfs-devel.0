From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 19:56:10 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87k6vgxjs5.fsf@uhoreg.ca>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
 <20040828170515.GB24868@hh.idb.hist.no>
 <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
 <41333225.7070801@hist.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Helge" == Helge Hafting <helge.hafting@hist.no> writes:

Helge> Linus Torvalds wrote:

[...]

>> That doesn't really help us. What would the name be, and how could you
>> avoid clashes?

Helge> The name for the file stream and the directory would be the same,
Helge> distinguished by how they're used.  I.e. fopen("filedirname",
Helge> "rw") gets the stream, while chdir("filedirname") changes into
Helge> the directory.  fopen("filedirname/substream", "rw"); opens some
Helge> stream inside the directory - as usual.

The problem is that filedirname now cannot contain a file called
"substream", or else it will clash with the name of the substream.

One solution is to put all streams into another subdirectory, much like
"metas" in Reiser4.  So to access a stream named "substream", you open
filedirname/streams/substream (replace "streams" with some carefully
chosen name that is user-friendly and highly unlikely to produce
clashes, such as "..streams", following the original "metas" proposal
which has been discussed to death on the ReiserFS list.  Or
"pseudos/streams", or one of countless variations).

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

