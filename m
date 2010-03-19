From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: R4 2.6.33 inconsistent keys
Date: Fri, 19 Mar 2010 17:49:58 +0100
Message-ID: <4BA3AB36.8030106@gmail.com>
References: <e4cc97d91003190852r374b43d5j5838a12eca1eec08@mail.gmail.com> <4BA3A66B.5000508@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BA3A66B.5000508@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Edward Shishkin wrote:
> Luciano wrote:
>> First, thanks for this great filesystem. Been using it for years
>> without probs, so I hope it gets integrated into the mainline soon.
>>
>> However, I'm having some problems after upgrading from kernel 2.6.31.6
>> to 2.6.33. This is a 64 bit gentoo-patched kernel (just patches for
>> stability, I believe - no new features), with the reiser4 patches from
>> Edward's site. It's happened to me twice now that my X session locks
>> up and I see the following in my logs:
>>
>> Mar 19 15:05:23 [kernel] WARNING: Keys are inconsistent. Fsck?
>> Mar 19 15:05:23 [kernel] reiser4[gconfd-2(6033)]: cbk_level_lookup
>> (fs/reiser4/search.c:963)[vs-3533]:
>>   
>
> Yup, I know about this problem. I think this is an old bug which was
> sleeping and has woken up after mainline upgrade to 2.6.31.X
>
> I remember that VS pursued this bug with partial success right
> before leaving 2.5 years ago.
>
> This is reproducible for me and I am trying to narrow down the
> problem. 

This is a situation when trying to insert a key
{el = {22136708, 20075163819723075, 1384069, 131072}, pad = 22136708}

Insert position in the node is correct, but its right neighbor
has wrong value of ld_key:

node->left:----------------------------------------------------------
{el = {22136708, 18386395447120969, 1383892, 131124}, pad = 22136708} 
(ld_key)

{el = {22136708, 18386395447120969, 1383892, 131124}, pad = 22136708}
{el = {22136708, 18386395447120969, 1383892, 196608}, pad = 22136708}
...
{el = {22136708, 20075163819723075, 1383894, 196608}, pad = 22136708}

{el = {22136708, 20075163819723075, 1383894, 196657}, pad = 22136708} 
(rd_key)
node:----------------------------------------------------------------
{el = {22136708, 20075163819723075, 1383894, 196657}, pad = 22136708} 
(ld_key)

{el = {22136708, 20075163819723075, 1383894, 196657}, pad = 22136708}
{el = {22136708, 20075163819723075, 1384069,      0}, pad = 22136708}
{el = {22136708, 20075163819723075, 1384069,  65536}, pad = 22136708}

{el = {22136708, 20075163819723075, 1384069, 131072}, pad = 22136708} 
<<< insert

{el = {22136708, 21745356274552664, 1383939,      0}, pad = 22136708}
{el = {22136708, 21745356274552664, 1383939,  65536}, pad = 22136708}
{el = {22136708, 21745356274552664, 1383939, 131072}, pad = 22136708}
{el = {22136708, 21745356274552664, 1383939, 196608}, pad = 22136708}
{el = {22136708, 23442993670401603, 1384065,      0}, pad = 22136708}
...
{el = {22136708, 23720044866262066, 1383988, 131072}, pad = 22136708}

{el = {22136708, 23720044866262066, 1383988, 131118}, pad = 22136708} 
(rd_key)
node->right:---------------------------------------------------------
{el = {22136708, 21745356274552664, 1383939,      0}, pad = 22136708} 
(ld_ley) <<<< WRONG!

{el = {22136708, 23720044866262066, 1383988, 131118}, pad = 22136708}
{el = {22136708, 23720044866262066, 1383988, 196608}, pad = 22136708}
