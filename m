From: Radim Kolar <hsn@cybermail.net>
Subject: Re: BUG: uncorrectable/undetectable damage by reiserfsck
Date: Wed, 7 Aug 2002 20:45:59 +0200
Message-ID: <20020807184559.GA1828@home>
References: <1028663930.11027.ezmlm@namesys.com> <20020807050535.GA541@home> <20020807100235.A25242@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020807100235.A25242@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

> Can you please make a metadata snapshot from that filesystem
> (debugreiserfs -p /dev/device | gzip -9c >metadata.gz) and make that available
> for download.

when you will make a new version of debugreiserfs add option for not
dumping journal data, or option for filling these 32MB with zeros, so it
will compress better. It will made files considerably smaller. I am an
modemoid user.

http://home.worldonline.cz/~cz210552/err/metadata.bz2

let me know when i can remove this file.
