From: "David Fendrich" <david@fendrich.net>
Subject: Re: reiserfsck 3.6.11 locks up
Date: Mon, 22 Dec 2003 04:15:15 -0800
Message-ID: <84c101c3c885$41f70860$74cb010a@mail2world.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_84C2_01C3C842.33D3C860"
Return-path: <reiserfs-list-return-16373-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
To: vitaly@namesys.com, david@fendrich.net, reiserfs-list@namesys.com

------=_NextPart_000_84C2_01C3C842.33D3C860
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

The problem is solved. I used the 3.6.12pre version and everything went
smooth. 


So reiserfsck continues to do smth but no progress anymore, right?
Have you built the progs on the same computer where you run it?
Would you check your memory with memtest or similar?


I don't think that reiserfsck continued to do anything. The whole
computer froze, ssh went down, I couldn't even switch virtual terminals
(I run Gentoo linux 2.4.22-ac, so yes the progs are built on the same
computer with the only optimization being -03), but alt-sysrq worked.
This happened twice at exactly the same place in pass 1, so anyone else
having the same problem should try 3.6.12.

Thanks,
David 


------=_NextPart_000_84C2_01C3C842.33D3C860--

