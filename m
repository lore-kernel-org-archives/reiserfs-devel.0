From: Edward Shishkin <edward@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 20 Jan 2005 16:18:40 +0300
Message-ID: <41EFAFB0.2000606@namesys.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>	 <m38y7gx8kq.fsf@merlin.emma.line.org>	 <20041230235911.4911a20c.hihone@bigpond.net.au>	 <m3sm5nj2ef.fsf@merlin.emma.line.org> <41D42F93.9060107@namesys.com> <2f4958ff050118131714f5411c@mail.gmail.com> <41EE859D.3020305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41EE859D.3020305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gryzman@gmail.com>, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

Hans Reiser wrote:

> Grzegorz Ja=C5=9Bkiewicz wrote:
>
>> On Thu, 30 Dec 2004 08:40:51 -0800, Hans Reiser <reiser@namesys.com>=20
>> wrote:
>> =20
>>
>>> Fixing hash collisions in V3 to do them the way V4 does them would
>>> create more bugs and user disruption than the current bug we have all
>>> lived with for 5 years until now.  If someone thinks it is a small
>>> change to fix it, send me a patch.  Better by far to fix bugs in V4,
>>> which is pretty stable these days.
>>>  =20
>>
>>
>> As I understeand, tea hash is based on tea (tiny encryption aglo),
>> which was the cause of xbox-linux sucess, and few others.
>> Pleas consider updating it to use xxtea algo. I know, it won't be
>> backward compatbile, but well.
>> Where is about all the others, I don't use them, and for me tea is the
>> only resonable hash to use on systems where I have very much great
>> number of files per directory (to name it, Maildirs).
>> Never had such problem myself, every hash function has a weaknes.
>> Nothing new. But providing another, much stronger hash, or correct tea
>> hash to use xxtea, would be something good indeed.
>>
>> =20
>>
> Edward, please look into whether we should use xxtea in Reiser4, and=20
> make a recommendation to me.  We aren't changing V3, it is stable and=20
> I want to leave it that way.
>
> Hans
>
>
I found that:
1. xxtea is a correction to the Blocktea algorithm against the attack=20
not related to the original tea or xtea.
2. xtea is an upgrade of tea algo which eliminates two minor weakness of=20
the last one related to key attacks,
and not related to the collisions of tea hash (for each name tea hash=20
uses ciphering by the key constructed
by  this name).
So imho it doesn't make sense to upgrade the core rounds used in tea=20
hash. Any objections?

Edward.
