From: Oleg Drokin <green@namesys.com>
Subject: Re: access beyond end of device again
Date: Tue, 25 Jun 2002 12:13:53 +0400
Message-ID: <20020625121353.A3027@namesys.com>
References: <Pine.LNX.4.44.0206250044360.28871-100000@avon.timetraveller.org> <661330051733.20020624103045@redefine.org> <20020625095409.A6209@namesys.com> <1141375583133.20020626230935@redefine.org> <20020625101503.A878@namesys.com> <0819468.20020627004746@redefine.org> <20020625115505.A2937@namesys.com> <712080311.20020627010847@redefine.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="DocE+STaALJfprDB"
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10833-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <712080311.20020627010847@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Kevin <coggy@redefine.org>
Cc: reiserfs-list@namesys.com

--DocE+STaALJfprDB
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline

Hello!

On Thu, Jun 27, 2002 at 01:08:47AM -0700, Kevin wrote:

> > Well, you have some corrupted leaves in conjunction to corrupted unformatted
> > pointers. So reiserfsck --rebuild-tree seems to be needed.
> > Are you sure there is no data corruption when writing to disk?
> > There were reports that VIA chipsets have problems with more than 3 IDE
> > channels being in use simultaneously.
> > I am sure there is even a test suite that trigger these bugs reliable.
> > (you have not told us anything about your motherboard/system so may
> > be you do not use VIA chipset of course, but finding one of such tools
> > that uses several HDDs simultaneously is advisable).
> It is a 2x400 celeron on an Abit BP6.  There are 5 hdd's total, spread

Abit BP6 is particularly bad motherboard, you know.
And running celerons in SMP mode is not supported by Intel.
 
> across 3 controllers.  All the drives are the master on their channel,
> with no slaves.  As far as the testing, do you know of any such tools?
> It's worth a try.  However, when the file that triggered the error was
> written, the system was not under any stress at all.

E.g. http://www.bit-net.com/~rmiller/dt.html
Also take a look at the two messages from lkml, I have attached.

Bye,
    Oleg

--DocE+STaALJfprDB
Content-Type: text/plain; charset=koi8-r
Content-Disposition: attachment; filename=m1

From linux-kernel-owner+green=40namesys.com@vger.kernel.org  Wed May  8 05:48:03 2002
Return-Path: <linux-kernel-owner+green=40namesys.com@vger.kernel.org>
Delivered-To: green@localhost.namesys.com
Received: from localhost (localhost [127.0.0.1])
	by angband.namesys.com (Postfix on SuSE Linux 7.3 (i386)) with ESMTP id CEAAC41907
	for <green@localhost>; Wed,  8 May 2002 05:48:03 +0400 (MSD)
Delivered-To: green@namesys.com
Received: from thebsh.namesys.com [212.16.7.65]
	by localhost with POP3 (fetchmail-5.9.0)
	for green@localhost (single-drop); Wed, 08 May 2002 05:48:03 +0400 (MSD)
Received: (qmail 29959 invoked from network); 8 May 2002 01:46:15 -0000
Received: from vger.kernel.org (209.116.70.75)
  by thebsh.namesys.com with SMTP; 8 May 2002 01:46:15 -0000
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id <S315478AbSEHBoK>; Tue, 7 May 2002 21:44:10 -0400
Received: (majordomo@vger.kernel.org) by vger.kernel.org
	id <S315479AbSEHBoJ>; Tue, 7 May 2002 21:44:09 -0400
Received: from pop.gmx.net ([213.165.64.20]:62967 "HELO mail.gmx.net")
	by vger.kernel.org with SMTP id <S315478AbSEHBoI> convert rfc822-to-8bit;
	Tue, 7 May 2002 21:44:08 -0400
Received: (qmail 32229 invoked by uid 0); 8 May 2002 01:44:01 -0000
Received: from adsl-162-85.adsl-pool.axelero.hu (HELO lead) (62.201.85.162)
  by mail.gmx.net (mp001-rz3) with SMTP; 8 May 2002 01:44:01 -0000
Reply-To: <bPObject@axelero.hu>
From: "P. Breuer" <bPObject@gmx.ch>
To: <andre@linux-ide.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: PROBLEM: silent data corruption using HPT370 on an ABIT VP6
Date:	Wed, 8 May 2002 03:43:59 +0200
Message-ID: <EGEOJJNFHLHGOKNADENLOEGCCFAA.bPObject@gmx.ch>
MIME-Version: 1.0
Content-Type:	text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Importance: Normal
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
X-Mailing-List:	linux-kernel@vger.kernel.org
Status: RO
Content-Length: 3968
Lines: 83

1. Silent disk corruption using HPT370 on an ABIT VP6

2. I have tracked down a crooked bug somewhere in the IDE driver
   leading to a slow and silent data corruption, which is a most alarming threat
   for the incautious. The case is simple: "cp file1 file2; diff file1 file2"
   shows differences under certain conditions.

3. Keywords: kernel, driver, ide, data corruption, i386

4. Kernel versions: 2.4.16 or 2.4.18 (error reproducible in both versions)

5. Hardware environment (details see below):
   ABIT VP6 motherboard including: dual Pentium III, VIA APOLLO PRO chipset
   VIA onboard EIDE controller,
   HPT370 "raid" UDMA/100 controller, integrated on board
   Promise TX2 (PDC) UDMA/100 PCI controller card
   Hard disks (all masters):
     2 x 6GB Quantum Fireball EX6.4A on VIA,
     2 x 40GB Quantum FireballP AS40.0 on PDC,
     2 x 40GB Quantum FireballP AS40.0 on HPT

6. Software environment:
   IDE driver (kernel-integrated)
   raidtools-0.90-5 (optional)
   General: four 40GB disks of identical geometry have three partitions each,
     same partitioning, identified by /dev/hd[e,g,i,k][1-3],
     /dev/md[0-2} are three RAID-5 arrays defined on the four disks accordingly
     each out of three raid partitions are formatted ext3 with internal journal

7. ERROR description:
   Let "file1" be a "large" data file, e.g. 1GB, on a RAID array described above.
   Then "cp file1 file2; cmp -l file1 file2" shows (subtle) differences.
   There are random differences on several random spots between the files.
   The "spots" occur usually as blocks of few bytes in succession. The difference
   is up to several dozens of bytes at a 1GB file copy.

8. Tracking down the error:
   I have conducted over 100 test cases: the error is consistent, though random.

   First I excluded an error in the raid software:
     umount /dev/md[0-2]; raidstop /dev/md[0-2].
   I used a script to read all four raw disks concurrent:
   
   for d in e, g, i, k; do \
    (for i in 1 2 3 4 5; do \
      dd if=/dev/hd"$d"1 count=2500000 \
      2> /dev/null | md5sum; done \
    ) >> trc"$d".md5sum done
   
   I found NO differences in trce.md5sum and trcg.md5sum (both disks are on the
   Promise controller), but significant differences in trci.md5sum and trck.md5sum,
   displaying 3 and 5 different read results out of 5 identical reads, resp.
   (both disks are on the HPT370 controller).

   Oops!!!

   I stayed focused on the HPT370 controller, and compiled a small test environment with a
   single processor motherboard and a HPT370A PCI controller card, which, in addition, has
   the same HPT BIOS version (1.0.3b1) as the integrated one. I found no problem using this
   configuration, so the error might well be related only to the SMP architecture.

9. Solution or workaround?
   I browsed through the HighPoint Software web pages and found a remarkable replacement
   for the kernel IDE-driver. This is a SCSI IDE emulation module, called hpt37x2.o, that
   can be built for "any" 2.4.x kernel. And IT WORKS, at least for me, since at least two days ;)
   The only drawback is, that it is not GPL-d and the complete source is not available.
   The existence of a working driver is a profound proof for the kernel driver to be in error!

10. Attachments:
   I have saved several files out of /proc, boot log, etc. from the test period,
   i.e. by using the faulty driver. They are available upon request. Due to the fact, that the
   HPT driver is not a native IDE-driver, but a SCSI-emulation, it is not possible to switch
   between booting the old and new kernels very easily. One example, the raid arrays are not
   recognised from the foreign configuration.

Peter Breuer [P.Breuer@freemail.hu]
   

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/


--DocE+STaALJfprDB
Content-Type: text/plain; charset="koi8-r"
Content-Disposition: attachment; filename=m2
Content-Transfer-Encoding: base64

RnJvbSBsaW51eC1rZXJuZWwtb3duZXIrZ3JlZW49NDBuYW1lc3lzLmNvbUB2Z2VyLmtlcm5lbC5v
cmcgIFR1ZSBNYXkgMTQgMjI6MDQ6MDQgMjAwMgpSZXR1cm4tUGF0aDogPGxpbnV4LWtlcm5lbC1v
d25lcitncmVlbj00MG5hbWVzeXMuY29tQHZnZXIua2VybmVsLm9yZz4KRGVsaXZlcmVkLVRvOiBn
cmVlbkBsb2NhbGhvc3QubmFtZXN5cy5jb20KUmVjZWl2ZWQ6IGZyb20gbG9jYWxob3N0IChsb2Nh
bGhvc3QgWzEyNy4wLjAuMV0pCglieSBhbmdiYW5kLm5hbWVzeXMuY29tIChQb3N0Zml4IG9uIFN1
U0UgTGludXggNy4zIChpMzg2KSkgd2l0aCBFU01UUCBpZCAwRTE5M0IxN0ExCglmb3IgPGdyZWVu
QGxvY2FsaG9zdD47IFR1ZSwgMTQgTWF5IDIwMDIgMjI6MDQ6MDQgKzA0MDAgKE1TRCkKRGVsaXZl
cmVkLVRvOiBncmVlbkBuYW1lc3lzLmNvbQpSZWNlaXZlZDogZnJvbSB0aGVic2gubmFtZXN5cy5j
b20gWzIxMi4xNi43LjY1XQoJYnkgbG9jYWxob3N0IHdpdGggUE9QMyAoZmV0Y2htYWlsLTUuOS4w
KQoJZm9yIGdyZWVuQGxvY2FsaG9zdCAoc2luZ2xlLWRyb3ApOyBUdWUsIDE0IE1heSAyMDAyIDIy
OjA0OjA0ICswNDAwIChNU0QpClJlY2VpdmVkOiAocW1haWwgMTE1NzMgaW52b2tlZCBmcm9tIG5l
dHdvcmspOyAxNCBNYXkgMjAwMiAxODowMzozMSAtMDAwMApSZWNlaXZlZDogZnJvbSB2Z2VyLmtl
cm5lbC5vcmcgKDIwOS4xMTYuNzAuNzUpCiAgYnkgdGhlYnNoLm5hbWVzeXMuY29tIHdpdGggU01U
UDsgMTQgTWF5IDIwMDIgMTg6MDM6MzEgLTAwMDAKUmVjZWl2ZWQ6IChtYWpvcmRvbW9Admdlci5r
ZXJuZWwub3JnKSBieSB2Z2VyLmtlcm5lbC5vcmcgdmlhIGxpc3RleHBhbmQKCWlkIDxTMzE1OTM1
QWJTRU5SNEo+OyBUdWUsIDE0IE1heSAyMDAyIDEzOjU2OjA5IC0wNDAwClJlY2VpdmVkOiAobWFq
b3Jkb21vQHZnZXIua2VybmVsLm9yZykgYnkgdmdlci5rZXJuZWwub3JnCglpZCA8UzMxNTkzN0Fi
U0VOUjRJPjsgVHVlLCAxNCBNYXkgMjAwMiAxMzo1NjowOCAtMDQwMApSZWNlaXZlZDogZnJvbSBt
YWlsLm5ldGJlYXQuZGUgKFs2Mi4yMDguMTQwLjE5XTo1MzI2NiAiSEVMTyBtYWlsLm5ldGJlYXQu
ZGUiKQoJYnkgdmdlci5rZXJuZWwub3JnIHdpdGggU01UUCBpZCA8UzMxNTkzNUFiU0VOUnprPjsK
CVR1ZSwgMTQgTWF5IDIwMDIgMTM6NTU6NDAgLTA0MDAKUmVjZWl2ZWQ6IChxbWFpbCAyMzE1IGlu
dm9rZWQgZnJvbSBuZXR3b3JrKTsgMTQgTWF5IDIwMDIgMTc6NTc6MzEgLTAwMDAKUmVjZWl2ZWQ6
IGZyb20gcGQ5NTQyYTA1LmRpcC50LWRpYWxpbi5uZXQgKEhFTE8gcXMyKSAoMjE3Ljg0LjQyLjUp
CiAgYnkgbWFpbC5uZXRiZWF0LmRlIHdpdGggU01UUDsgMTQgTWF5IDIwMDIgMTc6NTc6MzEgLTAw
MDAKRGF0ZToJVHVlLCAxNCBNYXkgMjAwMiAxOTo1NTozMyArMDIwMApGcm9tOiBIZW5uaW5nIFNj
aHJvZWRlciA8aGdzQGFubmEtc3RyYXNzZS5kZT4KWC1NYWlsZXI6IFRoZSBCYXQhICh2MS41M2Qp
ClJlcGx5LVRvOiBIZW5uaW5nIFNjaHJvZWRlciA8aGdzQGFubmEtc3RyYXNzZS5kZT4KT3JnYW5p
emF0aW9uOiA9P0lTTy04ODU5LTE/Qj9RVzV1WVhOMGNtRnpjMlVnVi94eWVtSjFjbWM9Pz0KWC1Q
cmlvcml0eTogMyAoTm9ybWFsKQpNZXNzYWdlLUlEOiA8Mzc5NDg3MDUxLjIwMDIwNTE0MTk1NTMz
QGFubmEtc3RyYXNzZS5kZT4KVG86IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKU3ViamVj
dDogSURFICpkYXRhIGNvcnJ1cHRpb24qIFZJQSBWVDgzNjcKTUlNRS1WZXJzaW9uOiAxLjAKQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PUlTTy04ODU5LTEKQ29udGVudC1UcmFuc2Zl
ci1FbmNvZGluZzogOGJpdApTZW5kZXI6IGxpbnV4LWtlcm5lbC1vd25lckB2Z2VyLmtlcm5lbC5v
cmcKUHJlY2VkZW5jZTogYnVsawpYLU1haWxpbmctTGlzdDoJbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZwpTdGF0dXM6IFJPCkNvbnRlbnQtTGVuZ3RoOiA1MTk4CkxpbmVzOiAxMjgKCkhlbGxv
LAoKSbRtIG5vdCBxdWl0ZSBzdXJlIHdoZXRoZXIgdGhpcyBpcyBhIGtlcm5lbCBpc3N1ZSwgYnV0
IEkgY2FutHQgdGhpbmsKb2YgYW5vdGhlciBldmlsZG9lciA6LSkKCkFTVVMgQTdWMjY2LUUgTWFp
bmJvYXJkIChWVDgzNjcgW0tUMjY2XSBDaGlwc2V0LCB3aXRoIFZJQSBJREUgYW5kClByb21pc2Ug
MjAyNjUgSURFIENvbnRyb2xsZXIgb24gYm9hcmQpLCA0eCBNQVhUT1IgNkwwMjBKMSAoMjBHQgpB
VEEtMTAwKSBhdHRhY2hlZCBhdCB0aGUgZm91ciBwb3J0cyAocmVzdWx0aW5nIGluIGhkYSwgaGRj
LCBoZGUsIGhkZykuCgpSb2JpbiBNaWxsZXK0cyBEYXRhIFRlc3QgUHJvZ3JhbSAoZHQpIGZyb20K
aHR0cDovL3d3dy5iaXQtbmV0LmNvbS9+cm1pbGxlci9kdC5odG1sIHJlcG9ydHMgZGF0YSBlcnJv
cnMgb24gKGFuZApvbmx5IG9uKSBoZGcgd2hlbiB0ZXN0cyBhcmUgcnVuIGluIHBhcmFsbGVsLiBU
aGlzIGlzIGVzcGVjaWFsbHkgbmFzdHkKYmVjYXVzZSBpIHBsYW4gdG8gdXNlIHRoZSBkcml2ZXMg
aW4gYSBSQUlELTAgZmFzaGlvbiB3aGljaCByZXN1bHRzIGluCmRhdGEgZXJyb3JzIGFzIHdlbGwu
CgpUaGVzZSBjb21iaW5hdGlvbnMgZ2l2ZSBlcnJvcnM6IChoZGEgaGRjIGhkZSBoZGcpLCAoaGRj
IGhkZSBoZGcpCgpUaGVzZSBjb21iaW5hdGlvbnMgcnVuIGZsYXdsZXNzOiAoaGRhIGhkYyBoZGUp
LCAoaGRlIGhkZyksIChoZGEgaGRjCmhkZykuIEkgZGlkIG5vdCB0ZXN0IG1vcmUgY29tYmluYXRp
b25zIGJlY2F1c2UgZXZlcnkgdGVzdCB0YWtlcyBzb21lCmhvdXJzLgoKQXR0YWNoaW5nIGhkZyBh
cyBhIHNsYXZlIGRyaXZlIHRvIHRoZSBmaXJzdCBwcm9taXNlIHBvcnQgKHdoaWNoIGdpdmVzCm1l
IGhkZiBpbnN0ZWFkIGFuZCB0aGUgc2Vjb25kIHByb21pc2UgcG9ydCBlbXRweSkgbWFrZXMgdGhl
IGFycmF5IHJ1bgpmaW5lLCBidXQgcGVyZm9ybWFuY2UgZHJvcHMgdG8gYSBmaWd1cmUgY29tcGFy
YWJsZSB0byBhIHNpbmdsZSBkcml2ZS4KClRoZXJlIGFyZSBubyBlcnJvciBsb2dzIHdoYXRzb2V2
ZXIgKGV4Y2VwdCBmb3IgdGhlIGR0IG91dHB1dCkuIFdpdGhvdXQKUkFJRC1hcnJheSBhbmQgd2l0
aG91dCBoZWF2eSBJREUgYWNjZXNzLCB0aGUgbWFjaGluZSBydW5zIHN0YWJsZS4KCktlcm5lbHMg
dGVzdGVkOiAyLjQuMTgsIDIuNC4xOXByZTgKCkhhcyBhbnlib2R5IHNlZW4gdGhpcyBiZWZvcmU/
IEFueSBpbmZvIHdvdWxkIGJlIGFwcHJlY2lhdGVkLiBJIHdvdWxkCmJlIGhhcHB5IHRvIHByb3Zp
ZGUgbW9yZSBpbmZvcm1hdGlvbi4KCkRpYWdub3N0aWNzIGF0dGFjaGVkIGJlbG93LgoKCi0tLS0t
LS0gb3V0cHV0IGZyb20gZHQgKHRoaXMgaXMgYWN0dWFsbHkgb3V0cHV0IGZyb20gdGVzdGluZyB0
aGUgcmFpZAphcnJheSkgLS0tLS0tLS0tLS0tLS0tLQoKQ29tbWFuZCBMaW5lOgoKICAgICUgZHQu
ZC9kdCBvZj0vZGF0YS90ZXN0IGxpbWl0PTFnIG1pbj01MTIgbWF4PTMyayBhbGlnbj1yb3RhdGUg
cHJvY3M9MTUgbG9nPWR0bG9nIHJ1bnRpbWU9MTJoIAoKICAgICAgICAtLT4gRGF0ZTogSnVuZSAy
bmQsIFZlcnNpb246IDE0LjEwLCBBdXRob3I6IFJvYmluIFQuIE1pbGxlciA8LS0KClsuLi5dCgpk
dCAoMjE1MCk6IEVycm9yIG51bWJlciAxIG9jY3VycmVkIG9uIFdlZCBNYXkgIDggMjA6MTY6NDAg
MjAwMgpkdCAoMjE1MCk6IERhdGEgY29tcGFyZSBlcnJvciBhdCBieXRlIDUxMTYgaW4gcmVjb3Jk
IG51bWJlciAzNgpkdCAoMjE1MCk6IFJlbGF0aXZlIGJsb2NrIG51bWJlciB3aGVyZSB0aGUgZXJy
b3Igb2NjY3VyZWQgaXMgNjM5IChvZmZzZXQgNTA4KQpkdCAoMjE1MCk6IERhdGEgZXhwZWN0ZWQg
PSAweGRlLCBkYXRhIGZvdW5kID0gMHgzMywgYnl0ZSBjb3VudCA9IDE4NDMyCmR0ICgyMTUwKTog
VGhlIGluY29ycmVjdCBkYXRhIHN0YXJ0cyBhdCBhZGRyZXNzIDB4ODBiMTY4OCAobWFya2VkIGJ5
IGFzdGVyaXNrICcqJykKZHQgKDIxNTApOiBEdW1waW5nIFBhdHRlcm4gQnVmZmVyIChiYXNlID0g
MHg4MGIxNjg4LCBvZmZzZXQgPSAwLCBsaW1pdCA9IDQgYnl0ZXMpOgoKMHg4MGIxNjg4ICpkZSBj
NiBkZSBjNgoKZHQgKDIxNTApOiBUaGUgaW5jb3JyZWN0IGRhdGEgc3RhcnRzIGF0IGFkZHJlc3Mg
MHg4MGIzM2ZmIChtYXJrZWQgYnkgYXN0ZXJpc2sgJyonKQpkdCAoMjE1MCk6IER1bXBpbmcgRGF0
YSBCdWZmZXIgKGJhc2UgPSAweDgwYjIwMDMsIG9mZnNldCA9IDUxMTYsIGxpbWl0ID0gNjQgYnl0
ZXMpOgoKMHg4MGIzM2RmICBkZSBjNiBkZSBjNiBkZSBjNiBkZSBjNiBkZSBjNiBkZSBjNiBkZSBj
NiBkZSBjNgoweDgwYjMzZWYgIGRlIGM2IGRlIGM2IGRlIGM2IGRlIGM2IGRlIGM2IGRlIGM2IGRl
IGM2IGRlIGM2CjB4ODBiMzNmZiAqMzMgMzMgMzMgMzMgZGUgYzYgZGUgYzYgZGUgYzYgZGUgYzYg
ZGUgYzYgZGUgYzYKMHg4MGIzNDBmICBkZSBjNiBkZSBjNiBkZSBjNiBkZSBjNiBkZSBjNiBkZSBj
NiBkZSBjNiBkZSBjNgoKClsuLi5dCgpkdCAoMjE0OCk6IEVycm9yIG51bWJlciAxIG9jY3VycmVk
IG9uIFdlZCBNYXkgIDggMjA6MTY6NDIgMjAwMgpkdCAoMjE0OCk6IERhdGEgY29tcGFyZSBlcnJv
ciBhdCBieXRlIDIwNDQgaW4gcmVjb3JkIG51bWJlciA4NTcKZHQgKDIxNDgpOiBSZWxhdGl2ZSBi
bG9jayBudW1iZXIgd2hlcmUgdGhlIGVycm9yIG9jY2N1cmVkIGlzIDI3MzQzIChvZmZzZXQgNTA4
KQpkdCAoMjE0OCk6IERhdGEgZXhwZWN0ZWQgPSAweGZmLCBkYXRhIGZvdW5kID0gMHgyNiwgYnl0
ZSBjb3VudCA9IDEyODAwCmR0ICgyMTQ4KTogVGhlIGluY29ycmVjdCBkYXRhIHN0YXJ0cyBhdCBh
ZGRyZXNzIDB4ODBiMTY4OCAobWFya2VkIGJ5IGFzdGVyaXNrICcqJykKZHQgKDIxNDgpOiBEdW1w
aW5nIFBhdHRlcm4gQnVmZmVyIChiYXNlID0gMHg4MGIxNjg4LCBvZmZzZXQgPSAwLCBsaW1pdCA9
IDQgYnl0ZXMpOgoKMHg4MGIxNjg4ICpmZiAwMCBmZiAwMAoKZHQgKDIxNDgpOiBUaGUgaW5jb3Jy
ZWN0IGRhdGEgc3RhcnRzIGF0IGFkZHJlc3MgMHg4MGIyN2ZjIChtYXJrZWQgYnkgYXN0ZXJpc2sg
JyonKQpkdCAoMjE0OCk6IER1bXBpbmcgRGF0YSBCdWZmZXIgKGJhc2UgPSAweDgwYjIwMDAsIG9m
ZnNldCA9IDIwNDQsIGxpbWl0ID0gNjQgYnl0ZXMpOgoKMHg4MGIyN2RjICBmZiAwMCBmZiAwMCBm
ZiAwMCBmZiAwMCBmZiAwMCBmZiAwMCBmZiAwMCBmZiAwMAoweDgwYjI3ZWMgIGZmIDAwIGZmIDAw
IGZmIDAwIGZmIDAwIGZmIDAwIGZmIDAwIGZmIDAwIGZmIDAwCjB4ODBiMjdmYyAqMjYgMzMgNjcg
NjYgZmYgMDAgZmYgMDAgZmYgMDAgZmYgMDAgZmYgMDAgZmYgMDAKMHg4MGIyODBjICBmZiAwMCBm
ZiAwMCBmZiAwMCBmZiAwMCBmZiAwMCBmZiAwMCBmZiAwMCBmZiAwMAoKWy4uLl0KCmR0ICgyMTYw
KTogRXJyb3IgbnVtYmVyIDEgb2NjdXJyZWQgb24gV2VkIE1heSAgOCAyMDoxNjo0NiAyMDAyCmR0
ICgyMTYwKTogRGF0YSBjb21wYXJlIGVycm9yIGF0IGJ5dGUgMjQ1NzIgaW4gcmVjb3JkIG51bWJl
ciA0OQpkdCAoMjE2MCk6IFJlbGF0aXZlIGJsb2NrIG51bWJlciB3aGVyZSB0aGUgZXJyb3Igb2Nj
Y3VyZWQgaXMgMTIyMyAob2Zmc2V0IDUwOCkKZHQgKDIxNjApOiBEYXRhIGV4cGVjdGVkID0gMHgz
OSwgZGF0YSBmb3VuZCA9IDB4ZmYsIGJ5dGUgY291bnQgPSAyNTA4OApkdCAoMjE2MCk6IFRoZSBp
bmNvcnJlY3QgZGF0YSBzdGFydHMgYXQgYWRkcmVzcyAweDgwYjE2ODggKG1hcmtlZCBieSBhc3Rl
cmlzayAnKicpCmR0ICgyMTYwKTogRHVtcGluZyBQYXR0ZXJuIEJ1ZmZlciAoYmFzZSA9IDB4ODBi
MTY4OCwgb2Zmc2V0ID0gMCwgbGltaXQgPSA0IGJ5dGVzKToKCjB4ODBiMTY4OCAqMzkgOWMgYzMg
MzkKCmR0ICgyMTYwKTogVGhlIGluY29ycmVjdCBkYXRhIHN0YXJ0cyBhdCBhZGRyZXNzIDB4ODBi
N2ZmYyAobWFya2VkIGJ5IGFzdGVyaXNrICcqJykKZHQgKDIxNjApOiBEdW1waW5nIERhdGEgQnVm
ZmVyIChiYXNlID0gMHg4MGIyMDAwLCBvZmZzZXQgPSAyNDU3MiwgbGltaXQgPSA2NCBieXRlcyk6
CgoweDgwYjdmZGMgIDM5IDljIGMzIDM5IDM5IDljIGMzIDM5IDM5IDljIGMzIDM5IDM5IDljIGMz
IDM5CjB4ODBiN2ZlYyAgMzkgOWMgYzMgMzkgMzkgOWMgYzMgMzkgMzkgOWMgYzMgMzkgMzkgOWMg
YzMgMzkKMHg4MGI3ZmZjICpmZiAwMCBmZiAwMCAzOSA5YyBjMyAzOSAzOSA5YyBjMyAzOSAzOSA5
YyBjMyAzOQoweDgwYjgwMGMgIDM5IDljIGMzIDM5IDM5IDljIGMzIDM5IDM5IDljIGMzIDM5IDM5
IDljIGMzIDM5CgoKWy4uLi4gYWQgbmF1c2VhdW1dCgotLS0tLS0tLS0tLS0tLSBsc3BjaSBvdXRw
dXQgLS0tLS0tLS0tLS0tCgowMDowMC4wIEhvc3QgYnJpZGdlOiBWSUEgVGVjaG5vbG9naWVzLCBJ
bmMuIFZUODM2NyBbS1QyNjZdCjAwOjAxLjAgUENJIGJyaWRnZTogVklBIFRlY2hub2xvZ2llcywg
SW5jLiBWVDgzNjcgW0tUMjY2IEFHUF0KMDA6MDYuMCBVbmtub3duIG1hc3Mgc3RvcmFnZSBjb250
cm9sbGVyOiBQcm9taXNlIFRlY2hub2xvZ3ksIEluYy4gMjAyNjUgKHJldiAwMikKMDA6MGMuMCBW
R0EgY29tcGF0aWJsZSB1bmNsYXNzaWZpZWQgZGV2aWNlOiBTMyBJbmMuIDg2Yzg2NCBbVmlzaW9u
IDg2NCBEUkFNXSB2ZXJzIDAKMDA6MGUuMCBFdGhlcm5ldCBjb250cm9sbGVyOiBJbnRlbCBDb3Jw
LiA4MjU1NyBbRXRoZXJuZXQgUHJvIDEwMF0gKHJldiAwYykKMDA6MGYuMCBFdGhlcm5ldCBjb250
cm9sbGVyOiBJbnRlbCBDb3JwLiA4MjU1NyBbRXRoZXJuZXQgUHJvIDEwMF0gKHJldiAwYykKMDA6
MTEuMCBJU0EgYnJpZGdlOiBWSUEgVGVjaG5vbG9naWVzLCBJbmMuIFZUODIzMyBQQ0kgdG8gSVNB
IEJyaWRnZQowMDoxMS4xIElERSBpbnRlcmZhY2U6IFZJQSBUZWNobm9sb2dpZXMsIEluYy4gQnVz
IE1hc3RlciBJREUgKHJldiAwNikKCgoKLS0gCkJlc3QgcmVnYXJkcywKIEhlbm5pbmcgICAgICAg
ICAgICAgICAgICAgICAgICAgIG1haWx0bzpoZ3NAYW5uYS1zdHJhc3NlLmRlCgotClRvIHVuc3Vi
c2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1r
ZXJuZWwiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwu
b3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jk
b21vLWluZm8uaHRtbApQbGVhc2UgcmVhZCB0aGUgRkFRIGF0ICBodHRwOi8vd3d3LnR1eC5vcmcv
bGttbC8KCg==

--DocE+STaALJfprDB--
