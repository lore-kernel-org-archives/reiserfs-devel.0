From: "Giuliano Luppi" <g_luppi@brokerstudio.it>
Subject: Mount fails after reiserfsck --rebuild-tree failure
Date: Thu, 19 Jun 2003 21:11:29 +0200
Message-ID: <FCEDLNJPOJKGBCPDLKPGGEFMCBAA.g_luppi@brokerstudio.it>
Reply-To: "Ing. Davide Imbeni" <davide.imbeni@tei.ericsson.se>,
   <davide.imbeni@tiscali.it>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01C336A7.5A2DDFA0"
Return-path: <reiserfs-list-return-14636-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0009_01C336A7.5A2DDFA0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Estimated sirs,
after experiencing some problems accessing files on a reiserfs file system
(SuSE linux 8.1, kernel 2.4), I tried reiserfsck =96rebuild-tree.
Since the problem resulted to be in the hardware, it failed, leaving me with
an unmountable partition (root inode set to 0)

As suggested in you site=92s FAQ (section 2), I tried with the latest
reiserfsprogs (3.6.7-pre1), installed on another HD (with RedHat). The
latter also failed.

Now I know the problems are (a lot of) bad blocks.

I would like to
1.	re-enable mounting the partition, in order to recover some of the data I
still have there (I know, I should backup more often=85 :-( )
2.	possibly fix the badblocks (as you describe in section 38 of the FAQ), in
order to bring up the system until new hard disks are ready.

The main question is: how can I undo the setting of root inode to 0?
Is there a good way for dealing with faulty hardware with reiserfs?

Thank you very much for your answers

Davide Imbeni

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.489 / Virus Database: 288 - Release Date: 10/06/2003

------=_NextPart_000_0009_01C336A7.5A2DDFA0--

