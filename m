From: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Tue, 18 Jan 2005 22:17:52 +0100
Message-ID: <2f4958ff050118131714f5411c@mail.gmail.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
	 <m38y7gx8kq.fsf@merlin.emma.line.org>
	 <20041230235911.4911a20c.hihone@bigpond.net.au>
	 <m3sm5nj2ef.fsf@merlin.emma.line.org> <41D42F93.9060107@namesys.com>
Reply-To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D42F93.9060107@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

On Thu, 30 Dec 2004 08:40:51 -0800, Hans Reiser <reiser@namesys.com> wrote:
> Fixing hash collisions in V3 to do them the way V4 does them would
> create more bugs and user disruption than the current bug we have all
> lived with for 5 years until now.  If someone thinks it is a small
> change to fix it, send me a patch.  Better by far to fix bugs in V4,
> which is pretty stable these days.

As I understeand, tea hash is based on tea (tiny encryption aglo),
which was the cause of xbox-linux sucess, and few others.
Pleas consider updating it to use xxtea algo. I know, it won't be
backward compatbile, but well.
Where is about all the others, I don't use them, and for me tea is the
only resonable hash to use on systems where I have very much great
number of files per directory (to name it, Maildirs).
Never had such problem myself, every hash function has a weaknes.
Nothing new. But providing another, much stronger hash, or correct tea
hash to use xxtea, would be something good indeed.

-- 
GJ
