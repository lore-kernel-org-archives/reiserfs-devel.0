From: Hubert Chathi <hubert@uhoreg.ca>
Subject: Re: Reiser4 crash
Date: Wed, 14 Nov 2007 16:40:48 -0500
Message-ID: <87zlxgtsin.fsf@evinrude.uhoreg.ca>
References: <5c7c368b0711141324l168d9b9fq1fb01cbddbc359cb@mail.gmail.com> <5c7c368b0711141328j444738c0i77011c02bd70c81@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5c7c368b0711141328j444738c0i77011c02bd70c81@mail.gmail.com> (Edward Shishkin's message of "Thu\, 15 Nov 2007 00\:28\:33 +0300")
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

On Thu, 15 Nov 2007 00:28:33 +0300, "Edward Shishkin" <edward.shishkin@gmail.com> said:

> Hubert Chathi <hubert () uhoreg ! ca>  wrote:
>> On Thu, 18 Oct 2007 17:34:49 +0400, Edward Shishkin
>> <edward@namesys.com> said:
>> 
>> > Hmm.. this is the bug encountered by Zan Lynx a long time ago.  So
>> my > fixup was insufficient. It seems some race take place here, I
>> will try > to catch this..
>> 
>> I haven't had this problem in a while. (no changes -- same kernel,
>> reiser4 versions) Perhaps it was just a spurious hardware error.

> I would be more pessimistic ;)

You're right.  Reiser4 was crashing fairly often until I reported the
problem on the list.  After I reported the problem, it stopped
crashing.  Now that I have said that all is now fine, it will surely
start crashing again! ;)

-- 
Hubert Chathi - Email/Jabber: hubert@uhoreg.ca - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA   (Key available at wwwkeys.pgp.net)
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
