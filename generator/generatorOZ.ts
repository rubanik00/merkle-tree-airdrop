import { StandardMerkleTree } from "@openzeppelin/merkle-tree";
import fs from "fs";

function generateRoot() {
  const values = [
    ["0x016C8780e5ccB32E5CAA342a926794cE64d9C364", "10000000000000000000"],
    ["0x2e234DAe75C793f67A35089C9d99245E1C58470b", "100000000000000000000"],
  ];

  const tree = StandardMerkleTree.of(values, ["address", "uint256"]);

  console.log("Merkle Root:", tree.root);

  fs.writeFileSync("tree.json", JSON.stringify(tree.dump()));
}

function generateProof() {
  const tree = StandardMerkleTree.load(
    JSON.parse(fs.readFileSync("tree.json", "utf8"))
  );

  for (const [i, v] of tree.entries()) {
    if (v[0] === "0x2e234DAe75C793f67A35089C9d99245E1C58470b") {
      const proof = tree.getProof(i);
      console.log("Value:", v);
      console.log("Proof:", proof);
    }
  }
}

generateRoot();
generateProof();
