From: "Robert MannI" <robmnl@gmail.com>
Subject: Files as directories
Date: Mon, 1 Jan 2007 17:57:59 +0100
Message-ID: <45cff9770701010857i29231cedlb829705bfd37482a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30350-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello!


Is reiser4 capable of having files within files?

e.g.:
song.mp3/artist.txt
song.mp3/albumart.jpg
etc.


If it is, how do I get it to work? I compiled linux 2.6.15 + reiser4
patch + metas patch, but all I get from that is the capability of
using the .... (metas) directory within files:

cd song.mp3/....
cat uid
etc





Thanks,
Robert
