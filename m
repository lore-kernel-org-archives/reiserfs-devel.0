From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 13:27:20 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <878ybzkwav.fsf@uhoreg.ca>
References: <Pine.LNX.4.58.0408260919380.2304@ppc970.osdl.org> <XFMail.20040827111855.pochini@shiny.it>
 <MPG.1b992c526a4726c59896d9@news.gmane.org> <87hdqomn7w.fsf@uhoreg.ca>
 <MPG.1b9ad1e799adc9319896db@news.gmane.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

>>>>> "Giuseppe" == Giuseppe Bilotta <bilotta78@hotpop.com> writes:

Giuseppe> Hubert Chan wrote:

>> No.  To access the database-like functionality in WinFS, you need to
>> use a special API.

Giuseppe> I see, thanks. Might be interesting to know what they plan to
Giuseppe> make accessible of WinFS to legacy apps via the old API, then
Giuseppe> (especially since, at according to a /. article, they're
Giuseppe> planning to retrofit WinFS to WinXP ...)

AFAIK, all files are still accessible through normal NTFS.  You just
need the special API to do querying and such.  So old apps can access
all the files normally.  They just can't take advantage of all the new
whizbang features.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

