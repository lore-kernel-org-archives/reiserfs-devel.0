From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Tue, 28 Jun 2005 15:57:35 -0400
Message-ID: <87mzpantjk.fsf@evinrude.uhoreg.ca>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>
	<200506261816.j5QIGMdI010142@turing-police.cc.vt.edu>
	<42BF08CF.2020703@slaphack.com>
	<200506262105.j5QL5kdR018609@turing-police.cc.vt.edu>
	<42BF2DC4.8030901@slaphack.com>
	<200506270040.j5R0eUNA030632@turing-police.cc.vt.edu>
	<42BF667C.50606@slaphack.com>
	<5284F665-873C-45B7-8DDB-5F475F2CE399@mac.com>
	<42BF7167.80201@slaphack.com>
	<EC02A684-815A-4DF8-B5C1-9029FE45E187@mac.com>
	<42C06D59.2090200@slaphack.com>
	<CD59AE36-FD15-4A4C-9E1D-AB2F8B52D653@mac.com>
	<42C08B5E.2080000@slaphack.com> <87y88vrzkg.fsf@evinrude.uhoreg.ca>
	<EBD8F590-0113-4509-9604-E6967C65C835@mac.com>
	<87mzpbrvpf.fsf@evinrude.uhoreg.ca>
	<D3A4ABBF-8062-4399-B1EC-61722295944A@mac.com>
	<87irzzrqu7.fsf@evinrude.uhoreg.ca>
	<2B1C058D-C304-4E15-ACDA-C3337E67E981@mac.com>
	<87d5q6pdyv.fsf@evinrude.uhoreg.ca> <42C1A5E8.2040603@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24774-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C1A5E8.2040603@slaphack.com> (David Masover's message of
 "Tue, 28 Jun 2005 14:32:56 -0500")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Tue, 28 Jun 2005 14:32:56 -0500, David Masover <ninja@slaphack.com> said:

> Hubert Chan wrote:
>> On Tue, 28 Jun 2005 02:01:12 -0400, Kyle Moffett
>> <mrmacman_g4@mac.com> said:

>>> I don't deny them the right to add other interfaces later, but such
>>> should be a secondary or tertiary patch, after the rest of the stuff
>>> is in.  In any case, if we were to provide an interface by which one
>>> could $EDITOR the POSIX ACLs, it should be done in the VFS where all
>>> filesystems can share it.

>> I don't know if VFS is the right place for it, but I agree that it
>> would be good to make it accessible to all filesystems.

Sorry, "accessible to all filesystems" is incorrect terminology (it's
backwards).  What I meant was something more like "able to access
extended data from all filesystems".  But I think everyone understands
what I meant.

> You put it in /meta, which is available to all filesystems.

>> Looking forward to the flamewar that happens when Namesys decides
>> that file-as-dir is ready to be turned on again. ;-)

> Namesys still hasn't commented directly on the /meta proposal, have
> they?  That would avoid the flamewar altogether.

Well, we could still have a flamewar about whether metafs is useful,
what type of functionality it should provide, etc.  I'm sure we could
find something to argue about. ;-)

From a purely philosophical/aesthetic/theoretical point of view, I like
file-as-dir much better than anything else, and would be ecstatic it if
Namesys was able to make it work.  From a practical/technical point of
view, metafs may be an acceptable compromise.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

