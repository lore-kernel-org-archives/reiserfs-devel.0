From: Diego Calleja <diegocg@teleline.es>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 19:40:10 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040826194010.548e4a4c.diegocg@teleline.es>
References: <20040826190548.3e67726f.diegocg@teleline.es>
	<Pine.LNX.4.44.0408261315240.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0408261315240.27909-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rik van Riel <riel@redhat.com>
Cc: jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

El Thu, 26 Aug 2004 13:16:22 -0400 (EDT) Rik van Riel <riel@redhat.com>=
 escribi=F3:

> So all I need to do is "cat /bin | gzip -9 > /path/to/backup.tar.gz" =
?

/bin could be separated (like linus said) but cat /bin/.compound could =
do
it. This is the /etc/passwd Hans' example, I think:

"If /new_syntax_access_path/big_directory_of_small_files/.glued is a pl=
ugin that
aggregates every file in big_directory_of_small_files with a delimiter
separating every file within the aggregation, then one can simply type =
emacs
/new_syntax_access_path/big_directory_of_small_files/.glued, and the fi=
lesystem
has done all the work emacs needs to be effective at this. Not a line o=
f emacs
needs to be changed."
-
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
