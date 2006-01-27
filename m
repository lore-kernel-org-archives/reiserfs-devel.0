From: Tom Vier <tmv@comcast.net>
Subject: Re: dump in reiserfs
Date: Fri, 27 Jan 2006 10:40:16 -0500
Message-ID: <20060127154016.GA9483@zero>
References: <43D9FB3E.9030309@Westminster.ac.uk> <1138363595.6238.49.camel@tribesman.namesys.com> <43DA2BA9.8040100@Westminster.ac.uk>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27904-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43DA2BA9.8040100@Westminster.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sujit Choudhury <S.Choudhury@westminster.ac.uk>
Cc: reiserfs-list@namesys.com

On Fri, Jan 27, 2006 at 02:18:17PM +0000, Sujit Choudhury wrote:
> Thanks Vladimir.  Is there anything that we can use so that we dump the 
> filesystem and use pipe to restore it from the input?
> By dump (I mean a replacement dump command).

Dump is only safe on unmounted or read-only filesystems, btw. It has a nice
interface, but you're better off using tar. See the -g option for
incremental backups.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
