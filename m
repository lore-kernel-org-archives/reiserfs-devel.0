From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Mon, 22 Mar 2004 17:37:18 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <8765cwqzj5.fsf@uhoreg.ca>
References: <20040316224523.39093.qmail@web60408.mail.yahoo.com> <20040317024931.GB5731@exavio.com.cn>
 <87k71kt8pv.fsf@uhoreg.ca>
 <200403201754.i2KHsCBX004402@turing-police.cc.vt.edu>
 <87hdwgr3mk.fsf@uhoreg.ca>
 <200403222128.i2MLSwpF007896@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Valdis" == Valdis Kletnieks <Valdis.Kletnieks@vt.edu> writes:

Valdis> There's 130,797 files in my Mail/ directory.  The only reason I
Valdis> use 'glimpse' on it is because although MH provides 'sequences'
Valdis> to do some basic metadata tagging, it requires me to add the
Valdis> metadata tags.

You can always use something like ifile, or more static filters
(regexps, header values, etc.), to do automatic tagging, and just
manually tag when it gets things wrong.  (If you already have your mails
tagged/organized into directories, it should be fairly trivial to do the
conversion.)  If you really want something like glimpse functionality,
you can always create/get a plugin to do that.  It might not be fast,
but I can't imagine that it would be any slower than just using glimpse.
And it definitely won't be any worse (functionality-wise) than just
using glimpse.  That way you can do "cd ~/Mail/[glimpse query]", and see
all the mails that match.

Valdis> For instance, the real-life note I mentioned would have to be
Valdis> added to the 'supercomputing', 'security, 'friends' and 'news'
Valdis> sequences.

Yes, if you tag manually, but I assume most of those would be caught by
the automatic tagger.  Or you don't have to use tags, and use a
filesystem plugin just like you would use glimpse.

If you put everything in ~/Mail in a flat directory structure, I don't
think you'll be losing anything.  If you use procmail to put things in
folders, you can still use procmail to do automatic tagging, or some
similar scheme.  If you do simple word indexing, you can still do word
indexing through the filesystem.  I don't really see anything where you
would be losing functionality.

(And, of course, if you want to keep your old filing system, you're
free to do that as well.  Reiser6 isn't going to force you to do
anything you don't want to.)

Valdis> Ask yourself how useful Google would be if the owner of the
Valdis> webpage had to provide metadata to tell it how to classify it -
Valdis> in fact, "metadata/keyword stuffing" turned out to be a major
Valdis> problem for Google.

Well yes, because people lied about their keywords, so that they would
show up more.  I'm assuming that a user isn't going to lie about their
own keywords.

Yes, Google is useful because it can grep a page and try to figure out
what it's about.  But I'm not expecting that Google will be 100%
accurate.  If you want Google-like functionality, you can create a
plugin.  I don't think that Namesys is planning on creating their own
indexer, and assuming that it's going to work for absolutely everyone.
But I think this is out of the scope of what the original thread was
about, at least as far as I can tell.

P.S. no need to cc me.  I read the list.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

