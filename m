From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Wed, 17 Mar 2004 11:49:13 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <873c87l8qe.fsf@uhoreg.ca>
References: <20040316224523.39093.qmail@web60408.mail.yahoo.com> <20040317024931.GB5731@exavio.com.cn>
 <87k71kt8pv.fsf@uhoreg.ca> <20040317062809.GD5731@exavio.com.cn>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17276-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Isaac" == Isaac Claymore <clay@exavio.com.cn> writes:

[...]

Isaac> I also stumbled upon Gnome Storage, at:

Isaac> http://www.gnome.org/~seth/storage/index.html

Isaac> If I get it right, they seem to be doing it in user space, what's
Isaac> your idea on this?

Yeah.  I was going to mention that, but I forgot.  Thanks for bringing
it up.  Yes, AFAICT, it's all in userspace.  Since it's done by GNOME
people, I assume that they will make a gnome-vfs module so that all
GNOME applications will be able to use it transparently.  But that
won't help other apps.

It seems to be based on a relational model, which Hans has been saying
is a bad way of organizing user data (and I would agree, but I'm no
database expert, so my opinion doesn't count as much).

It also seems to completely ditch the hierarchy system -- I find that a
hierarchy (or some sort of semi-hierarchy) can be a very useful filing
system for some types of data, or at least in splitting your data into
manageable chunks.

But I haven't dealt with Storage -- I've only briefly looked over it --
so this is all mostly speculation.  It looks like a neat system, but I
think that Reiser6 will blow its socks off.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

