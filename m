From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Mon, 22 Mar 2004 16:08:51 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87hdwgr3mk.fsf@uhoreg.ca>
References: <20040316224523.39093.qmail@web60408.mail.yahoo.com> <20040317024931.GB5731@exavio.com.cn>
 <87k71kt8pv.fsf@uhoreg.ca>
 <200403201754.i2KHsCBX004402@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17386-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Valdis" == Valdis Kletnieks <Valdis.Kletnieks@vt.edu> writes:

Valdis> On Tue, 16 Mar 2004 23:10:04 EST, Hubert Chan <hubert@uhoreg.ca>
Valdis> said:
Hubert> And document files too.  I'm looking forward to being able to
Hubert> being able to scrap this strange hierarchy system that I'm
Hubert> currently using for all my documents.  Email, too, would do well
Hubert> with this system.  Just toss all the mail in a single folder,
Hubert> and have your MUA query the filesystem for mails from the
Hubert> ReiserFS list, or mails from friends, etc.

Valdis> Ad-hoc query support in the file system (or even in user space)
Valdis> is always a problematic issue, because there's so many corner
Valdis> cases that result in a DWIM interface problem.

Yes.  When I wrote what I wrote, I was assuming that you have good
metadata that the filesystem can use.  I assume that semantic analysis,
DWIM, mind reading, etc., is out of the scope of the filesystem layer,
but anyone is free to implement a plugin that does what they want.

So when I say "mails from friends," I'm skipping most of the details,
which I think most people don't care about.  I'm really saying that I
would give the filesystem a list of email addresses of people that I
consider "friends," and get the filesystem to find all mails from those
addresses.  If someone from Zanzibar starts flooding me with the
virus-du-jour, then I refine my filter so that it excludes mails that
clamav detects viruses in.  (Actually, I would just configure clamav to
delete all mails that contain viruses.)  If my old college friend drops
me a mail, and I decide I want his mails to show up in my "friends"
query, then I add his email address to the list.  (Or add him to my
address book, mark him as "friend," and let the filesystem do the join.)

(Actually, I don't think I personally would use a "mails from friends"
query.  I would generally just use a "mails to/from person x.")

[...]

Valdis> And how does it know, other than simple word-indexing schemes (I
Valdis> already use 'glimpse', but even that gets painful when your
Valdis> e-mail archive goes back 15 years and totals over a gigabyte -
Valdis> compound searches take *forever*.

Well, Reiser4(? - with the appropriate plugin?) will let you add
arbitrary attributes through the everything-is-a-file-and-a-directory
mechanism, so you can add, for example, a "tags" attribute.  For all the
mails dealing with supercomputing, you add the supercomputing tag.  For
all security mails (that aren't already handled by your
security-mailing-list, etc. filters), you can add the security tag.
Then you tell the filesystem that the "tags" attribute is a handy thing
to index.  Again, I'm assuming that the user provides the filesystem
with useful metadata.  I don't assume that the filesystem can read your
mails and do automatic classification with 100% accuracy.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

