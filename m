From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Re2: Question about reiser performance - short system freezes
Date: Tue, 01 Mar 2011 17:42:53 +0100
Message-ID: <4D6D220D.2020309@gmail.com>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D65CEAF.31101.5A677E@jafojtik.seznam.cz>, <4D66A384.9000005@gmail.com> <4D6D0CE7.22102.64597@jafojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D6D0CE7.22102.64597@jafojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jaroslav Fojtik <jafojtik@seznam.cz>
Cc: reiserfs-devel@vger.kernel.org

On 03/01/2011 04:12 PM, Jaroslav Fojtik wrote:
> Dear Edward Shishkin,
>
>> It might be a regression that have been fixed in the latest
>> kernels. Consider upgrading to .37. If it doesn't disappear,
>> then please send the SysRq-w output.
>
> sorry, I cannot test on 2.6.37.2 :(
> reiser4 completely crashes kernel here.


Please, make sure you build everything correctly.
Also please avoid suffixed (37.x, etc) stuff: it
can contain changes incompatible with reiser4.

Edward.

>
> I do not understand messages in log, may be you do:
>
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e010scheduling while atomic: kworker/0:1/0/0x100101004ernil 5[9::/te3eoL7GU290F0U 5iau09 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2103 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2103 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e010scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[9::/te3eoL7GU290F0U 5iau09 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2107 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2107 a:4 01000<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e010scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2101 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2101 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 401e010scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2105 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2105 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e010scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2109 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2109 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e010scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[9::/te3eoL7GU290F0U 8iau09 000 EBP4f
> Mar  1 15:32:19 F&T kernel:>2109 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2109 a:4 0100<4000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e010scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[9::/te3eoL7GU290F0U 9iau09 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2104 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2104 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e010scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[9::/te3eoL7GU290F0U 9iau099 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2109 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2109 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 0[0::/te3eoL7GU290F0U 0iau10 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2114 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2114 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 0[0::/te3eoL7GU290F0U 0iau10 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2118 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2118 a:4 01.110090]  f54e9f98 f54e9f98 00000005 00000000 c100a118 00000005 00000005 00000005
> Mar  1 15:32:19 F&T kernel:<4ernil 6[0::/te3eoL7GU290F0U 6iau10 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x100104ernil 7[0::/te3eoL7GU290F0U 7iau10 000 EBP: f544f
> Mar  1 15:32:19 F&T kernel:>2117 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2117 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2118 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2119 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2112 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2113 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 2[1::/te3eoL7GU290F0U 2iau11 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2114 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2115 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 3[1::/te3eoL7GU290F0U 3iau11 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2115 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x1001014ernil 4[1::/te3eoL7GU290F0U 4iau11 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x100101004ernil 5[1::/te3eoL7GU290F0U 5iau11 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 0000
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2111 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2115 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 7[1::/te3eoL7GU290F0U 7iau11 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2119 a:4 0100<40 00000001e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[2::/te3eoL7GU290F0U 8iau12 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2117 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2117 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2117 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2113 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2114 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10014ernil 2[3::/te3eoL7GU290F0U 2iau13 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2114 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2115 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 3[3::/te3eoL7GU290F0U 3iau13 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2118 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2118 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[3::/te3eoL7GU290F0U 5iau13 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x1001014ernil 5[3::/te3eoL7GU290F0U 6iau13 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 6[3::/te3eoL7GU290F0U 6iau13 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2114 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2115 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 6[3::/te3eoL7GU290F0U 6iau13 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2118 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2119 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2113 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2113 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 7[3::/te3eoL7GU290F0U 7iau13 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2117 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2117 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[3::/te3eoL7GU290F0U 8iau13 000 E4f
> Mar  1 15:32:19 F&T kernel:>2111 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2111 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2115 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[3::/te3eoL7GU290F0U 8iau13 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2119 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2119 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 9[4::/te3eoL7GU290F0U 9iau14 000 EBP: f54f
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 401e011scheduling while atomic: kworker/0:1/0/0x10014ernil 0[5::/te3eoL7GU290F0U 0iau15 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  ba0 4801e0115160]  [<c1001cbb>] ? cpu_idle+0x3b/0x90
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 401e011scheduling while atomic: kworker/0:1/0/0x100101004ernil 4[5::/te3eoL7GU290F0U 4iau15 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 6[5::/te3eoL7GU290F0U 6iau15 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2115 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010104ernil 6[5::/te3eoL7GU290F0U 6iau15 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2119 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 401e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 7[5::/te3eoL7GU290F0U 7iau15 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2113 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2113 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 7[5::/te3eoL7GU290F0U 7iau15 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2117 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2117 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 8[5::/te3eoL7GU290F0U 8iau15 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2111 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2111 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[5::/te3eoL7GU290F0U 8iau15 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 8[5::/te3eoL7GU290F0U 8iau15 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>212 08cd08 6u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2119 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[6::/te3eoL7GU290F0U 9iau16 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 1[7::/te3eoL7GU290F0U 2iau17 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2111 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2111 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 2[7::/te3eoL7GU290F0U 3iau17 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2111 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2112 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2112 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2112 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[7::/te3eoL7GU290F0U 5iau17 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2112 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2112 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 6[7::/te3eoL7GU290F0U 6iau17 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2113 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2113 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2111 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2111 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x100101004ernil 7[7::/te3eoL7GU290F0U 7iau17 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2115 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 7[7::/te3eoL7GU290F0U 7iau17 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2119 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2119 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[7::/te3eoL7GU290F0U 8iau17 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2113 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2113 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[7::/te3eoL7GU290F0U 8iau17 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2117 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2117 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[7::/te3eoL7GU290F0U 9iau17 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2111 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2111 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[7::/te3eoL7GU290F0U 9iau17 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 480F0U 9iau18 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 0[9::/te3eoL7GU290F0U 0iau19 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x100101004ernil 1[9::/te3eoL7GU290F0U 1iau19 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 2[9::/te3eoL7GU290F0U 2iau19 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 3[9::/te3eoL7GU290F0U 3iau19 000 EBP: f54f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 4[9::/te3eoL7GU290F0U 4iau19 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 5[9::/te3eoL7GU290F0U 5iau19 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 6[9::/te3eoL7GU290F0U 6iau19 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 6[9::/te3eoL7GU290F0U 6iau19 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2110 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 7[9::/te3eoL7GU290F0U 7iau19 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2117 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2117 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x100101004ernil 8[9::/te3eoL7GU290F0U 8iau19 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2111 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2111 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2116 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2116 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[9::/te3eoL7GU290F0U 9iau19 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2110 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2111 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[9::/te3eoL7GU290F0U 9iau19 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2115 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2115 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e011scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 9[9::/te3eoL7GU290F0U 9iau19 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2120 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2120 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 0[0::/te3eoL7GU290F0U 0iau20 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2124 S0bS0bS08S00l 0[1::/te3eoL7GU290F0U 0iau21 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2123 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2123 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2123 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2124 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 2[1::/te3eoL7GU290F0U 2iau21 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2124 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2124 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x1001014ernil 3[1::/te3eoL7GU290F0U 3iau21 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2124 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2125 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 4[1::/te3eoL7GU290F0U 4iau21 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2125 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2125 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 5[1::/te3eoL7GU290F0U 5iau21 0004f
> Mar  1 15:32:19 F&T kernel:>2125 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2126 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2126 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2126 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 7[1::/te3eoL7GU290F0U 7iau21 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2126 S0bS0bS08S00S080 017]re oe0 i  40 task=f54ca0c0 task.ti=f54e8000)
> Mar  1 15:32:19 F&T kernel:>2123 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2123 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2127 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2128 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2122 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[1::/te3eoL7GU290F0U 9iau21 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2126 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2126 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010104ernil 9[1::/te3eoL7GU290F0U 0iau22 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2120 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2120 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 0[2::/te3eoL7GU290F0U 0iau22 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2124 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2124 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 0[2::/te3eoL7GU290F0U 0iau22 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00d34  30f  b  ba0 401e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 2[3::/te3eoL7GU290F0U 2iau23 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2125 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2126 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010104ernil 3[3::/te3eoL7GU290F0U 3iau23 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2126 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2127 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 401e012scheduling while atomic: kworker/0:1/0/0x100101004ernil 4[3::/te3eoL7GU290F0U 4iau23 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2129 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 5[3::/te3eoL7GU290F0U 5iau23 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2129 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 6[3::/te3eoL7GU290F0U 6iau23 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2129 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 7[3::/te3eoL7GU290F0U 7iau23 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2129 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 8[3::/te3eoL7GU290F0U 8iau23 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2125 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2125 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 8[3::/te3eoL7GU290F0U 8iau23 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2129 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2129 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 9[3::/te3eoL7GU290F0U 9iau23 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2123 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2123 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 9[3::/te3eoL7GU290F0U 9iau23 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2127 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2127 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 0[4::/te3eoL7GU290F0U 0iau24 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2121 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 0[4::/te3eoL7GU290F0U 0iau24 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2125 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2125 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 0[4::/te3eoL7GU290F0U 0iau24 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2129 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2120 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 1[4::/te3eoL7GU290F0U 1iau24 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2124 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2124 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 1[4::/te3eoL7GU290F0U 1iau24 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2128 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e012schedulil 2[5::/te3eoL7GU290F0U 2iau25 000 EBP4f
> Mar  1 15:32:19 F&T kernel:>2122 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2122 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2122 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2123 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e012s4ernil 5[5::/te3eoL7GU290F0U 5iau25 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2123 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2123 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 6[5::/te3eoL7GU290F0U 6iau25 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2123 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2123 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 7[5::/te3eoL7GU290F0U 7iau25 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2123 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2124 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[5::/te3eoL7GU290F0U 8iau25 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2124 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2124 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010104ernil 9[5::/te3eoL7GU290F0U 9iau25 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2124 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2124 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[5::/te3eoL7GU290F0U 9iau25 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2128 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 0[6::/te3eoL7GU290F0U 0iau26 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2122 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x100101004ernil 0[6::/te3eoL7GU290F0U 0iau26 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2126 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2126 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2120 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2120 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 1[6::/te3eoL7GU290F0U 1iau26 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2124 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2124 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 1[6::/te3eoL7GU290F0U 1iau26 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2128 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2122 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 2[6::/te3eoL7GU290F0U 2iau26 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2126 S0bS0bS08S00S080 012]re<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2120 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2121 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 4[7::/te3eoL7GU290F0U 5iau27 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2121 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2121 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2121 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2121 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 7[7::/te3eoL7GU290F0U 7iau27 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2121 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[7::/te3eoL7GU290F0U 8iau27 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2121 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[7::/te3eoL7GU290F0U 9iau27 000 E4f
> Mar  1 15:32:19 F&T kernel:>2121 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 0[8::/te3eoL7GU290F0U 0iau28 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2121 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2122 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 0[8::/te3eoL7GU290F0U 0iau28 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2129 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2129 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 1[8::/te3eoL7GU290F0U 1iau28 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2123 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2123 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x100101004ernil 1[8::/te3eoL7GU290F0U 1iau28 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2127 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2127 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x1001014ernil 2[8::/te3eoL7GU290F0207] EIP is at default_idle+0x5e/0xb0
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2125 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2125 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010104ernil 2[8::/te3eoL7GU290F0U 2iau28 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2129 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2129 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2125 S0bS0bS08S00S080 013]re oe0 i  =40 =4ernil 4[9::/te3eoL7GU290F0U 4iau29 000 EBP: f54f
> Mar  1 15:32:19 F&T kernel:>2127 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2127 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[9::/te3eoL7GU290F0U 5iau29 000 EBP: f54f
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2128 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2128 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2129 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2124 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2125 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e012scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[9::/te3eoL7GU290F0U 9iau29 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2126 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2126 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 0[0::/te3eoL7GU290F0U 0iau30 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2137 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2137 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 1[0::/te3eoL7GU290F0U 1iau30 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2136 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2136 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 1[0::/te3eoL7GU290F0U 2iau30 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2130 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2130 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2134 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 2[0::/te3eoL7GU290F0U 2iau30 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2138 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 401e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2136 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2137 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 4[0::/te3eoL7GU290F0U 4iau30 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2130 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2131 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 4[0::/te3eoL7GU290F0U 4iau30 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2135 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2135 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 4[0::/te3eoL7GU290F0U 4iau30 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2139 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 401e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 6[1::/te3eoL7GU290F0U 6iau31 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2138 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 1u_d34  30f  b  ba0 48 01e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 8[1::/te3eoL7GU290F0U 8iau31 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 018]40 =40 sti=f54e8000)
> Mar  1 15:32:19 F&T kernel: 2 08cd08 1u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 9[1::/te3eoL7GU290F0U 9iau31 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 2[2::/te3eoL7GU290F0U 2iau32 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2139 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 3[2::/te3eoL7GU290F0U 3iau32 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2133 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x100101004ernil 3[2::/te3eoL7GU290F0U 3iau32 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2137 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2137 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 4[2::/te3eoL7GU290F0U 4iau32 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2131 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2131 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 4[2::/te3eoL7GU290F0U 4iau324 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2135 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2135 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 4[2::/te3eoL7GU290F0U 4iau32 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2139 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[2::/te3eoL7GU290F0U 5iau32 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2133 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[2::/te3eoL7GU290F0U 5iau32 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2137 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2137 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 2u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0xe oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 3u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 0[4::/te3eoL7GU290F0U 0iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2133 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 1[4::/te3eoL7GU290F0U 1iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2133 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 2[4::/te3eoL7GU290F0U 2iau34 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2134 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 3[4::/te3eoL7GU290F0U 3iau34 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2134 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 3[4::/te3eoL7GU290F0U 3iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2138 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 4[4::/te3eoL7GU290F0U 4iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x1001014ernil 4[4::/te3eoL7GU290F0U 4iau34 000 EBP4f
> Mar  1 15:32:19 F&T kernel:>2136 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2136 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 4[4::/te3eoL7GU290F0U 5iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2130 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2130 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[4::/te3eoL7GU290F0U 5iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2134 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2135 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[4::/te3eoL7GU290F0U 5iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2139 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 6[4::/te3eoL7GU290F0U 6iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2133 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 6[4::/te3eoL7GU290F0U 6iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2137 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2137 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 7[4::/te3eoL7GU290F0U 7iau34 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2131 S0bS0bS08S00S080 017]re kworker/0:1 (pid: 0, ti=f54ea000 task=f54ca0c0 task.ti=f54e8000)
> Mar  1 15:32:19 F&T kernel:<4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 4u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2130 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2131 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 401e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2131 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2131 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x100101004ernil 9[5::/te3eoL7GU290F0U 9iau35 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2131 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 5u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 0[6::/te3eoL7GU290F0U 0iau36 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 1[6::/te3eoL7GU290F0U 1iau36 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 2[6::/te3eoL7GU290F0U 2iau36 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 3[6::/te3eoL7GU290F0U 3iau36 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 4[6::/te3eoL7GU290F0U 4iau36 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[6::/te3eoL7GU290F0U 5iau36 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2134 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[6::/te3eoL7GU290F0U 5iau36 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2139 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2139 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 6[6::/te3eoL7GU290F0U 6iau36 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2133 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 6[6::/te3eoL7GU290F0U 6iau36 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2138 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 7[6::/te3eoL7GU290F0U 7iau36 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 7[6::/te3eoL7GU290FLAGS: 00000246 CPU: 5
> Mar  1 15:32:19 F&T kernel:>2138 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 6u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S08rnil 7[7::/te3eoL7GU290F0U 7iau37 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 8[7::/te3eoL7GU290F0U 8iau37 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 9[7::/te3eoL7GU290F0U 9iau37 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 7u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 0[8::/te3eoL7GU290F0U 0iau38 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2133 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 1[8::/te3eoL7GU290F0U 1iau38 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2133 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 2[8::/te3eoL7GU290F0U 2iau38 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2134 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 3[8::/te3eoL7GU290F0U 3iau38 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2134 S0bS0bS08S00S080 013]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2135 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 4[8::/te3eoL7GU290FLAGS: 00000246 CPU: 5
> Mar  1 15:32:19 F&T kernel:<400 EB4f
> Mar  1 15:32:19 F&T kernel:>2136 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2136 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2133 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2133 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 5[8::/te3eoL7GU290F0U 5iau38 000 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2137 S0bS0bS08S00S080 015]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2138 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2132 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2132 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 6[8::/te3eoL7GU290F0U 6iau38 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2136 S0bS0bS08S00S080 016]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2136 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010104ernil 6[8::/te3eoL7GU290F0U 7iau38 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2130 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2130 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2134 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2138 S0bS0bS08S00S080 017]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2138 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 8u_d34  30f  b  ba0 4801e013scheduling while at00 EBP: f4f
> Mar  1 15:32:19 F&T kernel:>2134 S0bS0bS08S00S080 018]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2134 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e013scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel: 4ernil 9[9::/te3eoL7GU290F0U 9iau39 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2135 S0bS0bS08S00S080 019]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2136 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 9u_d34  30f  b  ba0 4801e014scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2147 S0bS0bS08S00S080 010]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2147 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e014scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:<4ernil 1[0::/te3eoL7GU290F0U 1iau40 000 EBP: 4f
> Mar  1 15:32:19 F&T kernel:>2149 S0bS0bS08S00S080 011]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2149 a:4 0100<0 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel:<4ernil 2[0::/te3eoL7GU290F0U 2iau40 000 EBP:4f
> Mar  1 15:32:19 F&T kernel:>2149 S0bS0bS08S00S080 012]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2140 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e014scheduling while atomic: kworker/0:1/0/0x10010100
> Mar  1 15:32:19 F&T kernel:>2149 S0bS0bS08S00S080 014]re oe0 i  =40 =40 stfe0
> Mar  1 15:32:19 F&T kernel:>2140 a:4 0100<40 00000000 00000000 00000000 00000000
> Mar  1 15:32:19 F&T kernel: 0 2 08cd08 0u_d34  30f  b  ba0 4801e014scheduling while atomic: kworker/0:1/0/0x10010100
>
> best regards
>     Jara
>
>
>
>
>>
>> Thanks,
>> Edward.
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

