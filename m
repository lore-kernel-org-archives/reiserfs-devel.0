From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Sun, 26 Jun 2005 19:16:48 -0500
Message-ID: <42BF4570.9010405@slaphack.com>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl> <42BCD93B.7030608@slaphack.com> <200506251420.j5PEKce4006891@turing-police.cc.vt.edu> <42BDA377.6070303@slaphack.com> <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu> <42BDC422.6020401@namesys.com> <42BE3645.4070806@cisco.com> <e692861c05062522071fe380a5@mail.gmail.com> <42BE563D.4000402@cisco.com> <42BE5DB6.8040103@slaphack.com> <200506261816.j5QIGMdI010142@turing-police.cc.vt.edu>            <42BF08CF.2020703@slaphack.com> <200506262105.j5QL5kdR018609@turing-police.cc.vt.edu> <42BF2DC4.8030901@slaphack.com> <42BF3D8F.4060503@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BF3D8F.4060503@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> David Masover wrote:
> 
> 
>>Valdis.Kletnieks@vt.edu wrote:
>>
>>
>>>On Sun, 26 Jun 2005 14:58:07 CDT, David Masover said:
>>
>>
>>>>"Plugins" is a bad word.  This user's combination of plugins is most
>>>>likely identical to other users', it's just which ones are enabled, and
>>>>which aren't?  If they are all included, I assume they play nice.
>>
>>
>>>Which ones are enabled. Exactly.
> 
> 
> Reiser4 plugins are not per user, but per kernel.  They are compiled
> in.  The model is intended to ease the development process, nothing
> more.  Apologies if the naming suggests more.

But, to avoid confusion, the inclusion of a crytocompress plugin in a
given kernel doesn't mean that all files accessed from that kernel are
encrypted and compressed.  It just means that you can pick an individual
file and set it to be transparently encrypted/compressed.

That is what I meant by "enabled".  Not per-user, but per-file.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQr9FcHgHNmZLgCUhAQJ2+BAAgnqAcEg41VXTUmpUUZWMduWeJKKYDE16
QvWore6MK/FWoU8hqFMddTzJVpzKNH8NoZ1Jfm2nEC51nndckwtBDsuIlMb1CGC+
I+wCrpe1kjXTz8sTs++CwDg29YojHP1/Wa5MwnUgTEBkZxacPI7r0VXyt1oO+f/N
Eu6Jpgl4IN3ba52/PS+dXCQrmOJDhLeHAb+l4rtRsK+LASJitqmGmpf4PRwEejM8
dWZyjEYdiAcMx6mkeB/lho5IIcp1Xi5QBACf6S8SHXvHxRW50cKeouAISR25Ttk2
Oa1vKhWPGo4IBREjK7fzgj6GwfpIBnUfE25ZRjrBRupWumwekaCAY91JOoRkdRI+
Lw70OZhqqIKQ/O46xqhyCrroP/6is5ZxLyIRe1q3qsQfsWUfHBOONRUBdtaTQlaa
3OWzAU49cxn4Jv9S9UEYEyKx9ggqJ5hd94wZpXPq4GogWt4S8cYK3d4ZtRIyXEBr
qOrLoJoTF9WeT254u+uq5gLP5kxq7Z7J51aMXbGF+4luuGJPq/50Y4hbapAMQWFA
v0Z8YNWoOnOJgYji/+u8qJhsfzBdi/dmWlhhy9Te1e1b/1+zHcsbCslgsIrG2spk
3uF1GOv5NorO2n7RhierhkUrkUsLLlFqf0vPmgMqJ9DG4h6wl3bOJkYShBKTYQB+
ldYcxERKMZ4=
=jv9S
-----END PGP SIGNATURE-----
