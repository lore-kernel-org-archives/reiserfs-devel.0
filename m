From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4/Encryption plugin stability?
Date: Tue, 31 May 2005 16:51:34 -0500
Message-ID: <429CDC66.2070101@slaphack.com>
References: <1ca1c141050531111473c21891@mail.gmail.com> <429CAD37.7030109@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429CAD37.7030109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: ADT <synfinatic@gmail.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> ADT wrote:
> 
>> Hi everyone,
>>
>> I'm looking into using reiser4 and it's encryption plugin on a number
>> of new CentOS4 servers I will be building.  I've been doing various
>> searches via google and the list archives, and I've seen a few emails
>> from last year which indicated that the encryption plugin wasn't yet
>> ready for primetime but it would be "soon".
>>
>> Any chance I could get a status update? 
>> Thanks,
>> Aaron
>>
>>  
>>
> 
> Hello.
> It will be available in reiser4.1 via pseudo interface, but only for
> compression transform
> for a while, wait for beta-release..

Weird.  I would have thought compression would be harder than encryption...

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQpzcZngHNmZLgCUhAQL/gg/+Ja0cIHyTRMGchPBlsMlgL7xYqu/sOi/b
qypODPehGoHjRf9RzgBlDmNP4O5IIKW88eOeEzCycybJi7Jzr5jIAFs//4JJ8MMI
YFp+XQ9ejQBAtolm3MkJR6wpsOaRkPXtN5XcGVuMpjiWSSxB0mQyzKTBPmL1btfI
mnIFnguJQjNKfi2bvCtqzNoxkksHJ4hxrwuZ9KtOIMDe6oMK80k4Z2LCu0cAx8ie
Ds7XAb6b8hxj21uasHYZPzfzCYxemr3oyJgQuSdd4faVDtKXoA2Yni6CCtB+9vOG
VXxRBVsAzNrYO6B4NcgY0tlLKf77BBmV+fQrZquMb4wApPZI1q0bH2G+U/3hq/5J
Chg6uoqvXPjTcf6Wxamok/5C7Lhju29jSowWsQ49IQg6erycoBaM5Y0JZ0FPJFAa
TLTYp/LyTLEmp86dpghH3bTHG1dGF4TfbjJdVPzku/GtEHPlJ6jiKBnJY8qrUBdX
Qz79W2EuVdnYuLpNYfniijyr8jB9KIzhBsDxTmORYx8QC+Nfaatw4uCSBd96jqd4
Ttpi6VtDIn63nUXskEEhMUr5KNtYu49lnHkdPWmJwFYDOfkORd/vNANKoHzGB8F3
WWzrpC1oBPhCwhH/VISNhzv03p79k8cS08ZysJnx/eqDtR0fWmGnrjawbE2rLloZ
Q8xeOtIs7p0=
=O/Rt
-----END PGP SIGNATURE-----
