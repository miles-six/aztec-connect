// Verification Key Hash: 6bbfd46d264205e96b0f874f633bbd3869272cc3651ff2cfe98134108db50a68
// SPDX-License-Identifier: GPL-2.0-only
// Copyright 2020 Spilsbury Holdings Ltd

pragma solidity >=0.6.0 <0.8.0;
pragma experimental ABIEncoderV2;

import {StandardTypes} from '../cryptography/StandardTypes.sol';
import {Bn254Crypto} from '../cryptography/StandardBn254Crypto.sol';

library Rollup1x2VkStandard {
    using Bn254Crypto for StandardTypes.G1Point;
    using Bn254Crypto for StandardTypes.G2Point;

    function get_verification_key() internal pure returns (StandardTypes.VerificationKey memory) {
        StandardTypes.VerificationKey memory vk;

        assembly {
            mstore(add(vk, 0x00), 8388608) // vk.circuit_size
            mstore(add(vk, 0x20), 17) // vk.num_inputs
            mstore(add(vk, 0x40),0x0210fe635ab4c74d6b7bcf70bc23a1395680c64022dd991fb54d4506ab80c59d) // vk.work_root
            mstore(add(vk, 0x60),0x30644e121894ba67550ff245e0f5eb5a25832df811e8df9dd100d30c2c14d821) // vk.domain_inverse
            mstore(add(vk, 0x80),0x2165a1a5bda6792b1dd75c9f4e2b8e61126a786ba1a6eadf811b03e7d69ca83b) // vk.work_root_inverse
            mstore(mload(add(vk, 0xa0)), 0x0b9fc8d4d01bb57b00b855698dbc04f9689fd71d7ade7e7fb7dc25b684c08cda)//vk.Q1
            mstore(add(mload(add(vk, 0xa0)), 0x20), 0x1e0202ec59c059b28fd5978b4ab605535656adc96e22e9346b79364573d1093d)
            mstore(mload(add(vk, 0xc0)), 0x1e5249c66a3387054b7b56ee5864759bd881deaccbbae621957d9a9e970964ad)//vk.Q2
            mstore(add(mload(add(vk, 0xc0)), 0x20), 0x099171a21eebba0c084fcf00157ee111309422799ec2ab3d25e4eedb8bade518)
            mstore(mload(add(vk, 0xe0)), 0x18938aa4eab41716d4381597c2228f14ebd948d3dd76bd64a1a4cbcf7e2b678f)//vk.Q3
            mstore(add(mload(add(vk, 0xe0)), 0x20), 0x040793e1194604022a5af0c3a95bf54a6973e39bd29970f525da299c850f54af)
            mstore(mload(add(vk, 0x100)), 0x252fec233999b27ce80a3d24ed461e6819420f3e7b025982da6791ccc9b1ee43)//vk.QM
            mstore(add(mload(add(vk, 0x100)), 0x20), 0x21475fc8eda64b467d80416b45d86cb7a617db3fa69c3b0f73507a455932a41b)
            mstore(mload(add(vk, 0x120)), 0x29143fb51707c96152e8e232fba1f117449219b6ec990151509b6e4fae96bf7d)//vk.QC
            mstore(add(mload(add(vk, 0x120)), 0x20), 0x16f995c80269f1f231552ffdc801d0406997f4e19be43cfe79a35e981978a114)
            mstore(mload(add(vk, 0x140)), 0x27e206f49fdae148663caca241e0bb1cb9cf1d5c351405ecc96ec54311af9819)//vk.SIGMA1
            mstore(add(mload(add(vk, 0x140)), 0x20), 0x038d32af1eabec7d08a7aadc7bf2d5685d78b475cf0c83689381b830a0484694)
            mstore(mload(add(vk, 0x160)), 0x043754b469a35d95ba521f35f83e1c570d03b931183ed612e0d5e429644fff3e)//vk.SIGMA2
            mstore(add(mload(add(vk, 0x160)), 0x20), 0x2f1ed96fe4c2e16c84843cd96576528b5be7c22a5efe882d4161ce9de40e4919)
            mstore(mload(add(vk, 0x180)), 0x17359c74a3c08d827fda64e56c0265792223e01725dfdc3fd8a7aac8c9b50747)//vk.SIGMA3
            mstore(add(mload(add(vk, 0x180)), 0x20), 0x0b0da4b0c133b14401affa9f569d9a9fa0404659d8061265cd80e0cfb1a91076)
            mstore(add(vk, 0x1a0), 0x01) // vk.contains_recursive_proof
            mstore(add(vk, 0x1c0), 1) // vk.recursive_proof_public_input_indices
            mstore(mload(add(vk, 0x1e0)), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1
            mstore(add(mload(add(vk, 0x1e0)), 0x20), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0
            mstore(add(mload(add(vk, 0x1e0)), 0x40), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1
            mstore(add(mload(add(vk, 0x1e0)), 0x60), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0
        }
        return vk;
    }
}
